# Inception
**Inception**  is more than just a Docker project it is a deep-dive into the "Philosophy of Containment."
This project marks the transition from running code on a machine to architecting a reproducible, isolated, and scalable environment.

By building a multi-container infrastructure (Nginx, MariaDB, and WordPress) using only the Docker CLI and Dockerfiles, you eliminate the  ```"it works on my computer"```  syndrome forever.

## The Core Architecture 
The project is built as a microservices architecture where each container has one specific job, communicating over a private internal network.
  - **Nginix** : The gatekeeper (Reverse Proxy) using TLS/SSL to secure traffic.
  - **WordPress** : The logic engine, handling dynamic content generation.
  - **MariaDB** : The persistent database, isolated from the outside world.

## Understanding the "How" 
> Containers vs. VMs

1 - First The Kernel Level: Namespaces & Cgroups : A container is not a "mini-computer" like a Virtual Machine; it is simply a Linux process with restricted vision and limited resources.
      _Namespaces_ is The "Blindfold." It ensures a process can only see its own PIDs, Network stack, and Mount points. _Cgroups_ (Control Groups) is the limits how much CPU, RAM, and I/O a process can consume.
2 - . The Filesystem : Inception explores the history of chroot (Change Root), the original "jail" that lets you pretend a specific folder is the / (root) of the entire system. While modern containers use pivot_root for better security, the principle remains: isolation at the file level.

_Appreciating the technology that delivers ready-to-use projects… because who has time for instructions anyway?_
