# # -*- coding: utf-8 -*-
import re,os,subprocess,signal,platform,sys,resource,time
import MySQLdb,psutil

#variables initialization
p = None
result = None
rc = None
sign = {
 1: "SIGHUP",       2: "SIGINT",       3: "SIGQUIT",      4:"SIGILL",
 5: "SIGTRAP",      6: "SIGABRT",      7: "SIGBUS",       8:"SIGFPE",
 9: "SIGKILL",     10: "SIGUSR1",     11: "SIGSEGV",      12:"SIGUSR2",
13: "SIGPIPE",     14: "SIGALRM",     15: "SIGTERM",      16:"SIGSTKFLT",
17: "SIGCHLD",     18: "SIGCONT",     19: "SIGSTOP",      20:"SIGTSTP",
21: "SIGTTIN",     22: "SIGTTOU",     23: "SIGURG",       24:"SIGXCPU",
25: "SIGXFSZ",     26: "SIGVTALRM",   27: "SIGPROF",      28:"SIGWINCH",
29: "SIGIO",       30: "SIGPWR",      31: "SIGSYS",       3334:"SIGRTMIN"
}
#gcc and g++ : turn off debugging and optimization level2 -O2 -fomit-frame-pointer
#rhino and php : -f filename
#java : -g:none : no debugging info  ,   -Xlint: enable warnings  ,   -d :directory where to put class files
langDict = {
"C" : {"extension":"c", "system":"find /usr/bin/ -name gcc","compile":"gcc [path]/[codefilename].c -O2 -fomit-frame-pointer -o [path]/[codefilename]","execute":"[path]/[exename]"},
"C++": {"extension": "cpp", "system": "find /usr/bin/ -name g++","compile": "g++ [path]/[codefilename].cpp -O2 -fomit-frame-pointer -o [path]/[codefilename]", "execute":"[path]/[exename]"},
"C#" : {"extension": "cs", "system":"find /usr/bin/ -name gmcs","compile":"gmcs [path]/[codefilename].cs", "execute":"mono [path]/[exename].exe"},
"Java" : {"extension" : "java", "system":"find /usr/bin/ -name javac","compile":"javac -g:none -Xlint -d [path] [path]/[codefilename].java", "execute":"java -classpath [path] [exename]"},
"Pascal": {"extension":"pas", "system":"find /usr/bin/ -name fpc","compile":"fpc [path]/[codefilename].pas","execute":"[path]/[exename]"},
"Haskell":{"extension":"hs","system":"find /usr/bin/ -name ghc","compile":"ghc [path]/[codefilename].hs -o [path]/[codefilename]","execute":"[path]/[exename]"},
"JavaScript": {"extension":"js", "system": "find /usr/bin/ -name rhino", "execute":"rhino -f [path]/[exename].js"},
"Perl": {"extension":"pl", "system":"find /usr/bin/ -name perl","execute":"perl [path]/[exename].pl"},
"Pike": {"extension":"pike", "system":"find /usr/bin/ -name pike","execute":"pike [path]/[exename].pike"},
"PHP": {"extension":"php", "system":"find /usr/bin/ -name php","execute":"php -f [path]/[exename].php"},
"Python2.7": {"extension":"py", "system":"find /usr/bin/ -name python2","execute":"python2 [path]/[exename].py"},
"Python3": {"extension":"py", "system":"find /usr/bin/ -name python3","execute":"python3 [path]/[exename].py"},
"Ruby": {"extension":"rb", "system":"find /usr/bin/ -name ruby","execute":"ruby [path]/[exename].rb"},
"AWK": {"extension": "awk", "system":"find /usr/bin/ -name awk","execute":"awk -f [path]/[exename].awk"},
"Bash": {"extension": "sh", "system":"find /bin/ -name bash","execute":"bash [path]/[exename].sh"},
"Brain" : {"extension": "bf", "system":"find /usr/bin/ -name bf","execute":"bf [path]/[exename].bf"},
"Text": {"extension":"txt"}
}

rid = 0
pid = 0
access = None
nof = 0
submit_time = None
exec_time = None
tex_time = None
username = None
path = None
codefilename = None
ext = None
langdB = None
contestcode = None
problemcode = None
env_path = None
status = None
memory = 0
Dlangs = []
soft_limit=1               #soft limit is the current limit, and may be lowered or raised by a process over time
hard_limit=2               #hard limit can be lowered to any value greater than the soft limit, but not raised
cpu_limit=20               #percentage of CPU usage(20%)
mem_limit = 1024000000      #in bytes  : 256MB
proc_limit = 0             #number of processes
file_limit = 3000000      #   max file size generated
as_limit = 256000000       #max area of address space

#insert judged submissions into submissions table        
def connect_db_judged():
    global tex_time
    try:
        db = MySQLdb.connect("localhost","root","root","code_online_judge")
        cursor = db.cursor()

        if(tex_time == None):
            tex_time = 0.0;
        
        access = "private"
        sql_ins = "INSERT INTO "+contestcode+"submissions VALUES('"+str(codefilename)+"','"+str(username)+"','"+str(langdB)+"','"+str(ext)+"','"+str(path)+"','"+str(result)+"','"+str(tex_time)+"','"+str(access)+"','"+str(submit_time)+"','"+str(rid)+"','"+str(pid)+"','"+str(contestcode)+"','"+str(memory)+"','"+str(problemcode)+"')"
        sql_del = "DELETE FROM queue WHERE codefilename='"+codefilename+"'"
        cursor.execute(sql_ins)
        cursor.execute(sql_del)
        db.commit()
        print sql_ins
        print sql_del
    except Exception as e:
        print "Exception=",e     
        db.rollback()           
    else:
        # disconnect from server
        db.close()

# Systems Check for languages
def system_check():
    global Dlangs
    for lang in langDict:
        if(lang != "Text" and os.popen(langDict[lang]["system"]).read() != ""): #os.popen() opens a pipe to the command 
                Dlangs.append(lang);


# Perform system checks
def platform_check():
    if(platform.system() != 'Linux'):
        print("Error : Platform Incompatible script\n")
        print("This script can run on Linux platform only")
        sys.exit(0);

# clear screen and Print Header
def print_header():
    exit_code = os.system("clear")
    print("\nCodeshare Online Judge\n");
    print "**********************************"
    print "Languages Supported on this System:"
    for i in range(len(Dlangs)):
        print Dlangs[i],",",
    print "\n"
    print "**********************************"

# Obtain lock
def obtain_lock():
    if(os.path.exists("lock.txt")):
        print("Error : Could not obtain lock on Online Judge Script\n")
        print("This problem usually occurs if : \n") 
        print("1) You are trying to run two instances of this script on the same machine at the same time.\n")
        print("2) Improper termination the last time this was run, or an error in the script itself\n")
        print("solution :  shut down all instances of this script, manually delete the 'lock.txt' file (in the same directory) and restart a single instance of it.\n");

        sys.exit(1);
    else:
        lock = open("lock.txt","w");
        print("Obtained lock on Online Judge Script\n");

def signal_handler(signum,frame):
    global p,result
    print 'Signal handler called with signal',signum
    result = "Time Limit Exceeded"
    p.terminate()
    print 'Time out'

     

#File Read/Write 
def file_read(filename):
    if not os.path.exists(filename):
        return "";
    f = open(filename,"r")
    data = f.read()
    f.close()
    return data.replace("\r","")        #replace extra \r befor \n 

def file_write(filename,data):
    f = open(filename,"w")
    f.write(data.replace("\r",""))
    f.close()

#Security : set resources limit on subprocess creation
def security():
    if(langdB == "Java" or langdB == "C#"):
        proc_limit = 300       #265
    else:
	proc_limit = 0
    pid = os.getpid()
    #ps = psutil.Process(pid)
    #ps.set_nice(cpu_limit)
    resource.setrlimit(resource.RLIMIT_CPU,(soft_limit,hard_limit))
    resource.setrlimit(resource.RLIMIT_NPROC,(proc_limit,proc_limit))          
    resource.setrlimit(resource.RLIMIT_RSS,(mem_limit,mem_limit))    
    resource.setrlimit(resource.RLIMIT_FSIZE,(file_limit,file_limit))
    #resource.setrlimit(resource.RLIMIT_AS,(as_limit,as_limit))

#Compilation
def compile():
    global result,codefilename,path,ext
    if (langDict[langdB]["extension"] == ext):
        cmd = langDict[langdB]["compile"]
        cmd = cmd.replace("[codefilename]",codefilename)
        cmd = cmd.replace("[path]",env_path)
        cmd = cmd.split(' ')
        print cmd
	path_stderr = env_path+"/stderr.txt";
        sp = subprocess.Popen(cmd,stderr = open(path_stderr,"w"),shell=False)       
        sp.communicate()
        #print path+"/"+codefilename
	if langdB == "Java":
		if not os.path.exists(env_path+"/Main.class"):
			result = "Compilation Error"
	elif langdB == 'C#':
		if not os.path.exists(env_path+"/"+codefilename+".exe"):
			result = "Compilation Error"
	else:
        	if not os.path.exists(env_path+"/"+codefilename):
           		 result = "Compilation Error"
	   
    else:
        result = "Invalid File"

#Execution
def execute(iteration):
    global p,rc,langDict,result,pid,exec_time,memory
    print "hello"
    if (langDict[langdB]["extension"] == ext):
	    cmd = langDict[langdB]["execute"]
	    if(langdB == "Java"):
		cmd = cmd.replace("[exename]","Main")
	    else:
		cmd = cmd.replace("[exename]",codefilename)
	    cmd = cmd.replace("[path]",env_path)
	    cmd = cmd.split(' ')
	    print cmd
	    #timelimit = 100
	    #signal.signal(signal.SIGALRM,signal_handler)         #set the handler for SIGALRM signal
	    #signal.alarm(timelimit)                              #set the alarm
	    stime = time.time()
	    path_stdout = env_path+"/stdout"+str(iteration)+".txt";
	    path_stderr = env_path+"/stderr"+str(iteration)+".txt";
	    path_stdin = path+"input"+str(iteration)+".txt";
	    p =subprocess.Popen(cmd,stdin = open(path_stdin,"r"),stdout = open(path_stdout,"w"),stderr = open(path_stderr,"w") ,shell=False,preexec_fn = security)                                                 #process creation pipe with stdin,stdout,stderror not through shell style command(string)   
	    p.communicate()                               #interacts with child process    
	   

       	    memory = (resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss)/1000.0

            etime = time.time()
	    exec_time = (etime - stime)/1000.0
	    exec_time = round(exec_time,4)
	    rc = p.returncode                                    #exit code of child process
	    if( abs(rc) == 9):
		result = "Time Limit Exceeded"
	    
	    pid = p.pid
	    print rc
	    #temp = os.waitpid(p.pid,0)[1]
	    #print temp
	    #signal.alarm(0)                                      #release the alarm
	    #os.system("rm lock.txt")
    else:
            result = "Invalid File" 
     	 

def compare(a,b):
    global result
    d1 = file_read(a)
    d2 = file_read(b)
   
    if(d1 == d2):
        result = "Accepted"
    elif(re.sub(r"\s","",d1) == re.sub(r"\s","",d2)):  #replace all whitespace(regular expression "\s") with ""
         result = "Presentation Error"
    else:
        result = "Wrong Answer"

def check_result():
    print "bye"
    global result,rc
    if(result == None):
        rc = abs(rc)
        if(rc == 0):
            result = "Success"
        elif(rc <= 34 and rc > 0):
            result = "Runtime Error (" + sign[rc] +")"
        else:
            result = "NZEC"
    
    if(ext == "txt"):
        result = "Success"

def judge():   
   
    global result,codefilename,username,langdB,ext,path,soft_limit,hard_limit,access,submit_time,contestcode,problemcode,nof,tex_time,exec_time
    print codefilename,username,langdB,ext,path,hard_limit,access,submit_time
    #compile only for c,c++,java,c#,pascal
    if ext not in ["awk","py","js","pl","php","rb","pike","sh","bf","txt"]:
        compile()
    
    #increase time limit for slow languages
    if ext in ["hs","php","py","rb"]:
        soft_limit *= 3
        hard_limit *= 3

    if ext in ["cs","java","js"]:
        soft_limit *= 2
        hard_limit *= 2
   
    print "hi" 
    tex_time = 0
    #execute for all lang except text
    if(result == None) and ext != "txt":
        for i in range(1,nof+1):
	    execute(i)
            check_result()
	    if(result == "Success"):
        	compare(env_path+"/stdout"+str(i)+".txt",path+"/output"+str(i)+".txt")
	    if(exec_time == None):
		exec_time = 0
	    tex_time += exec_time
	    if(result != "Accepted"):
		break
	    if(i < nof):
	    	result = None

    print result
    print tex_time
    
    #before updating submissions table .. compare the outputs
    #if(result == "Success"):
    #   compare(env_path+"/stdout.txt",path+"/out.txt")
        
    connect_db_judged()
    result = None

#Connect to Database
def connect_mysql():
    global codefilename,username,langdB,ext,path,soft_limit,hard_limit,access,submit_time,contestcode,problemcode,memory,env_path,nof
    try:
        # Open database connection
        db = MySQLdb.connect("localhost","root","root","code_online_judge")

        # prepare a cursor object using cursor() method
        cursor1 = db.cursor()
        cursor2 = db.cursor()
        # execute SQL query using execute() method.
        sql = "select count(*) from queue"
        cursor1.execute(sql)
        # Fetch a single row using fetchone() method.
        
        while(True):
            print "start -------------------"
            data = cursor1.fetchone()
            if(data != None):
                data = int(data[0])
            if(data == None):
                break;        
         
            qry = "select * from queue"
            try:
                cursor2.execute(qry)
                rs = cursor2.fetchall()
                for row in rs: 
                    codefilename = str(row[0])
                    username = row[1]
                    langdB = row[2]
                    ext = row[3]
                    path = row[4]
                    status = row[5]
                    hard_limit = row[6]     
                    soft_limit = hard_limit
                    access = row[7]
                    submit_time = row[8]
                    contestcode = row[11]
                    memory = row[12]
                    problemcode = row[13]    
		    nof = row[14]  
                    print codefilename,username,langdB,ext,path,hard_limit,access,submit_time,nof
                    env_path = "./env/"+codefilename
                    judge()  
                    print "-------------------"
            except Exception as e:
                print e
                print "Error : unable to fetch data"
            
            #cursor1.execute(sql)
            #data = cursor1.fetchone()         
                   
    except Exception as e:
        print e                
    else:
        # disconnect from server
        db.close()
if __name__ == "__main__":     #__name__ is the module name
    obtain_lock()
    platform_check()
    system_check()
    print_header()     

    connect_mysql()
    print "end"
    os.system("rm lock.txt")
    

    
   
    
