#Blocks

##Closures and Scope

A closure can be viewed asa a chunk of code that can be shared within a codebase. Closures bind to their surrounding environment. Closures are implemented using either a Proc, block or lambda in Ruby.

Closures are beneficial because they can be passed into existing methods

## How blocks work, and when we want to use them.

Blocks start and end with a `do`.. `end` or with `{}`. They are flexible pieces of code that can be passed into any method. This offers us greater flexibility and control in how we either implement or invoke our methods. 

-----

##Definitions

### Closure


a closure can be viewed as a chunk of code that can be shared within a codebase, and executed at a later time. Closures can be thought of something similar to a method, meaning they can be passed around and executed, but they are not defined with a specific name.

Closures bind to their surrounding environment, meaning they 'enclose' all their surrounding references, such as variables and methods, when they are executed. 
	

### Block


A block is a type of closure that we can work with. Blocks can be passed into existing Ruby methods

### Binding 
	
The binding of a closure encompasses the closure's environment, and tracks everything in its envirnoment that it may need at it's execution.
	
### Implementation vs Invocation


### Yielding

Yielding allows us to execute a block that is being passed into a method. 

### Local Jump Error
This is an error that occurs when the the yield keyword is executed, but there is no block that was given at during the invocation of a method. 

# implicit vs explicit block
# file open with block

### Kernel.block_given?
### Block parameter
### Arity
### Sandwich code
### explicit block parameter
### Blocks and Variable Scope
### &:symbol
### Symbol#to_proc 

## code coverage




