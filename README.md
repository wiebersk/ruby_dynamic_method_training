# ruby_dynamic_method_training
Training for Dynamic Ruby Method Building Techniques

## Conventions
Here are some conventions I found helpful to follow while trying to generate dynamic methods

### define_method
Define method is best used if you have a collection of things (array/hash) that you are iterating over to define methods for.  This is due to other core ruby methods returning that these methods are valid.

### method_missing
Method missing is useful when trying to define dynamic methods that are not tied to a collection of things.  For example, if you want to have an expressive method which is used to call something multiple times.  See SomeOtherBetterClass for an example of this