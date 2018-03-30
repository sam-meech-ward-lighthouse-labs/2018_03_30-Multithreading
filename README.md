# Multithreading

## Concurrency & Parallelism

* Concurrency:
    - Running two or more things at once. At least giving the illusion that two or more things are happening at once.
    - Could be context switching. Two checkouts at a grocery store with one cashier running very fast between them. 
    - Could be parallel. TWo checkouts at a grocery store with two cashiers.
* Parallelism:
    - When we can run things concurrently without context switching.

## What are threads?

* Processor, and a processor can have multiple **cores**. 
* Each core can run a processes in _parallel_ with respect to other cores.
* Each core will have multiple hardware threads.
* Each hardware thread will be able to process multiple software threads. 
* In our swift code, or any code, we can create software threads and run our code using them.

## Benefits of Multithreading

* You can avoid waiting for a long process to complete before starting another process. 
* GUI applications **always** need to be responsive to the user.
* Faster if you have a task or algorithm that can be easily split into *separate* parts so that parts of it may be run at the same time. 

## Issues with Multithreading

* Logically it makes coding more difficult to understand. It's easy to mess up the logic.
* Race conditions - when two concurrent processes are trying to access the same piece of memory at the same time. Usually when writing.
* Deadlock a process is relying on another process to complete, which is relying on the first process. 

---

## GCD & NSOperationQueue

* NSOperation is an object oriented framework for multithreading through queues. Was created before GCD, but now uses GCD under the hood.
* GCD is a C library. Bridged nicely though.
* GCD is open sourced, so it can run  on anything.

### Queues

* First in first out data structure. 
* We will interact with Queues. 
* There's a main queue that all code will run on when the app starts. By default, everything runs on this queue. 
* There exist other global background queues that we can easily add tasks to.
* We can create custom queues.
* Every queue has a qos class: https://developer.apple.com/library/content/documentation/Performance/Conceptual/EnergyGuide-iOS/PrioritizeWorkWithQoS.html
* Used behind the scenes to run your code effeciently.

### Serial vs. Concurrent

* Serial: one thing happens after another. The first thing has to completely finish before the second thing can start.
* Concurrent: Everything will get started fifo. Things will finish whenever they finish.

* The main queue is a serial queue.
* All of the background global queues, are concurrent.

### Synchronous vs. Asynchronous

* async will add to the back of a queue and continue with the current code.
* sync will add to the back of a queue and wait for that to complete before continuing with the current code.
* asyncAfter, put something into the queue after a certain amount of time.

### Dispatch Groups

* Use dispatch groups to get notified when many concurrent tasks are complete.

https://www.raywenderlich.com/148513/grand-central-dispatch-tutorial-swift-3-part-1