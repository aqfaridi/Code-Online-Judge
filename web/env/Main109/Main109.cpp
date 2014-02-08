import java.net.InetAddress;
import java.net.UnknownHostException;

 class LocalAddress {

    public static void main(String[] args) {
        InetAddress address = null;
        try {
            address = InetAddress.getLocalHost();
        } catch (UnknownHostException e) {
             e.printStackTrace();
        }
        if (address.isSiteLocalAddress()) {
            System.out.println("Site Local Address: " + address.getHostAddress());
        } else {
            System.out.println("Routeable Address: " + address.getHostAddress());
        }
    }

}
