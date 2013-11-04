# Programming

In this document we describe certain aspects of our programming implementation.  In particular, we give an overview of our unit tests.

## Basic coding

## Modularity

We separated our code according to the model-view-controller framework and  tried our best to follow the "fat model, skinney controller" paradigm.  We also wrote separate unit tests and used the `factory_girl_rails` gem to separate our test cases from depending on the test database.

### Code

### Specifications

## Verification

### Runtime assertions

### Unit tests

We implemented unit tests for our models under `test/unit/*.rb`. The important features that we made sure to cover with unit tests were our associations and any methods that we defined in our models. We made sure that these were tested for proper behaviour and output.

We also hand-tested our code extensively to ensure functional correctness.

## Security

We describe our security concerns in detail in the [Design doc](Design.md).

### Code
