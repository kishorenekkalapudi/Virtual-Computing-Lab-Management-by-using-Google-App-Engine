Virtual Computing Lab Management by using Google App Engine
===========================================================

The software allowed lab administrator to create new virtual machine instances based on-demand

• Allow a user to select, configure, and set up a desirable computing lab. Based on the cloud-based computing resources given in the selected cloud environment and technology. Typical computing resources, including computing machines (with selected OS platform), memory, storage, or software and tools.
•	Allow a user to select and deploy a set of software and tools in each machine.
•	Allow a user to monitor and report the configuration and deployment of all computes in each lab.

Here are typical components in our system: 
-  A web-based user interface to support user interactions to monitor the resource utilization of their 
   deployed software in a cloud environment (such as Google App. Engine or Amazon EC2). Typical 
   resource usage includes CPU time and memory size.   
-  A cloud-based resource management API interface to interact with the given resource management APIs 
   in your selected cloud technology. 
-  A repository component which supports book keeping of the configuration and set-up for each computing 
   lab. 
-  A virtual lab. engine which is a back-end component bridges the user interface and the repository. It 
   interacts with the above resource management APIs to support users to configure, select, and deploy 
   different computing resources and software for each lab. 

Technologies Used
=================
Java, HTML, Java Script, JSP, Servlets
