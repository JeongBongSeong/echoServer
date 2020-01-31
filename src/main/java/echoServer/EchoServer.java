/*
 * This Java source file was generated by the Gradle 'init' task.
 */

package echoServer;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class EchoServer {
    /** 
    *{@author JJJ} 
    */
    public void echoServer(){
        ServerSocket mServerSocket;
        Socket mSocket;

        BufferedReader brRecv; // Recv
        PrintWriter pwSend; // Send

        try {
            mServerSocket = new ServerSocket(7778); // Server Open
            System.out.println("Java Server Start!!!");

            mSocket = mServerSocket.accept();
            System.out.println("Client Connected");

            brRecv = new BufferedReader(new InputStreamReader(mSocket.getInputStream()));
            pwSend = new PrintWriter(mSocket.getOutputStream());
            while (true) {
                String strRecvMsg = brRecv.readLine();		// 
                System.out.println(strRecvMsg);

                if (strRecvMsg.equals("exit")) {
                    break;
                }

                // 클
                pwSend.println(strRecvMsg);		//
                pwSend.flush();
            }
            mSocket.close();
            mServerSocket.close();
        } catch (IOException exc) {
            exc.printStackTrace();
        }
    }
    public static void main(String[] args) {
        new EchoServer().echoServer();
    }
}
