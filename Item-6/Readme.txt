##Deploy instructions

Due to https implementation, to deploy in the pre-production machine, is necessary to make some changes.

	1- Stop apache.
	2- Generate a keystore
	3- Modify apache server.xml

#Generate keystore

Open a command promp and go to the java folder (C:\Program Files\Java\)
In the bin folder inside, execute the following
	keytool -genkey -alias tomcat -keyalg RSA

Then you would have to answer some questions, do it, and do not forget the password.

#Server.xml

Open your Tomcat installation directory and open the conf folder.
Inside this folder, you will find the server.xml file. Open it.

Replace the following:

	<!--
	<Connector port="8443" protocol="HTTP/1.1" SSLEnabled="true"
	    maxThreads="150" scheme="https" secure="true"
	    clientAuth="false" sslProtocol="TLS" />
	-->

By this: (change the password field with yours)

	<Connector SSLEnabled="true" acceptCount="100" clientAuth="false"
	    disableUploadTimeout="true" enableLookups="false" maxThreads="25"
	    port="8443" keystoreFile="C:/Documents and Settings/Boss/.keystore" keystorePass="password"
	    protocol="org.apache.coyote.http11.Http11NioProtocol" scheme="https"
	    secure="true" sslProtocol="TLS" />