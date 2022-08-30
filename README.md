# Implementation: Queue Abstract Data Type Using a Fixed Array
This repository contains my implementation in Ruby of a 
[Queue (abstract data type)](https://en.wikipedia.org/wiki/Queue_%28abstract_data_type%29)
using a fixed-size array.  This is based upon the challenge in the
_[Stacks and Queues](https://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/33-advanced-arrays/lessons/86-stacks-and-queues)_
lesson in the
**[Ruby Primer: Ascent](https://rubymonk.com/learning/books/4-ruby-primer-ascent)**
course.

This implementation is intended to be performant by maintaining the
fixed-size of the array at all times and implementing a "closed circle"
approach with index pointers to the front and rear of the array.
A [Modulo operation](https://en.wikipedia.org/wiki/Modulo_operation)
based on the fixed size of the array is used to advance the front and
rear index pointers.

This implementation also includes the functional unit tests implemented
in [RSpec](https://rspec.info/) and are located in the `spec`
subdirectory.

This implementation and tests follow standard
[Rubocop](https://rubocop.org/) and
[RuboCop-RSpec](https://github.com/rubocop/rubocop-rspec) linting and
code style.

## To Run Linting
To run the `rubocop-rspec` linter on the command line...
```
bundle exec rubocop --require rubocop-rspec
```

## To Run the Tests
To run **all** of the `rspec` tests on the command line...
```
bundle exec rspec
```

## To Build and Use the Docker Image
This project includes a very simple `Dockerfile` for building
an image and running the project as a container.

### Building the Image Using Docker
Assuming that you have Docker installed, to build the image on
the command line...
```
docker build --no-cache  -t fixed-array-queue .
```

### Running the Container Interactively Using Docker
Assuming that you have Docker installed, to run the container
interactively on the command line...
```
docker run -it --rm fixed-array-queue
```

This will run the Alpine command-line shell so that you can
interact with the container, for example to run the tests.
