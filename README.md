# FizzBuzz is a common interview question. It goes like this: 
# Write a function called fizz_buzz() that takes one integer parameter, n. 
# Return a list from 1 to n, but for each multiple of 3, return "Fizz", and for each multiple of 5, return "Buzz". 
# If a number is divisible by both 3 and 5, return "FizzBuzz"
# example : 
# > fizz_buzz(16)
# > [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 11, 'Fizz', 13, 14, 'FizzBuzz', 16]

# Most intermediate programmers can write a solution to this in about 5 minutes. 
# But even in a simple function like FizzBuzz, oppurtunities to write good code abound, and the pitfalls are perilous.

# takes an int, returns list with 3 for fizz and 5 for buzz
def fizzbuzz(n):
    result = []

    for i in range(1, n + 1):
        element = ''

        # the method... the "requirement"
        if i % 3 == 0:
            element = "Fizz"

        if i % 5 == 0:
            element += "Buzz"

        if element:
            result.append(element)
        else:
            result.append(i)

    return result

print(fizzbuzz(31))

# the above solution works, and fairly clearly lays out the logic. 
# But it's actually a lot to read - it requires a developer to spend quite a bit of time thinking through what are actually fairly steps. 
# For example, when tracing the above code, by the the time you're appending(i), an index variable of a loop to an array, your brain is 3 if statements deep. 
# it's hard to suss out what the final result is actually going to be from reading this, and so it requires mental gymnastics to get there. 

# In addition, imagine maintaining this code. What the client adds another requirement, where they say, "... and do this for Odd numbers only". 
# Easy enough, just wrap the entire inner-loop in a big "if i % 2 == 0"... What's one more if-statement? 

# Another approach: 
def fizzbuzz_one_liners(n):
    result = []

    for i in range(1, n + 1):
        element = ''
        element = "Fizz" if i % 3 == 0 else ''
        element += "Buzz" if i % 5 == 0 else ''
        result.append(element if element else i)

    return result

print(fizzbuzz_one_liners(16))

# What I like about this approach is the readability of the business logic. To me, that might as well be plain english. 
# It could be improved by making it a separate function, for sure, But It doesn't feel like nearly as much to hold in your brain.
# But I still feel like, my brain is forced to think too deeply about the element we're on.

# The final imlementation uses a list comprehension. And again, what I like about this the expressiveness and understandability of what's happening. 
# The difficulty in my mind with the leading for loop, is that it forces me to count and remember a number. When I first see the for loop, i have to wonder: is it counting something? summing? indexing an array?
# I start searching for the index variables - where are we using them? It opens up possibilities for my brain to wonder about. Not only that, my brain HAS to iterate through each number. I start to wonder, when is this going to end? 
# how far BACKWARDS do I need to remember to think? Does one iteration impact another (ie, a rolling sum that I also need to track?)

# Contrast that to the list comprehension. I know there's syntax to learn, but it's not overly scary. A leading hard bracket usually means a list in python, and that's true of list comprehensions: they return a list. 
# Then, they BLUF: bottom line up front. It does "element_transformer on i". The reader can look and see what that is, if they want. Then they see "for in range...", and that ends the story. 
# Do that thing we talked about, for each i in this list. Transform every element in this list. 

# Architecturally, there's an extremely helpful division between the higher level mechanistic and the lower level code. 
# imagine if the client wanted to modify the fizzBuzz tranformation algorithm. That code is encapsulated in one place, and larger control items won't break when it's modified.

# this isn't a soapbox about the "elegance" of this solution, or some "fewer lines than though" holiness. It's about helpfulness to the future dev, and the business use-case it's serving.
# it's also an easier set of unit tests to write. Please write unit tests.
def fizzbuzz_comprehension1(n):
    # all of the mechanistic logic... build the list, iterate. 
    return [element_transformer1(i) for i in range(1, n + 1)]

# the business logic
def element_transformer1(i):
        element = ''
        element = "Fizz" if i % 3 == 0 else ''
        element += "Buzz" if i % 5 == 0 else ''
        return element if element else i

print(fizzbuzz_comprehension1(31))



# A fantastically clever one:
def fizzbuzz_comprehension2(n):
    # all of the mechanistic logic... build the list, iterate. 
    return [element_transformer2(i) for i in range(1, n + 1)]

# the business logic
def element_transformer2(i):
        fizz = "Fizz" if i % 3 == 0 else ''
        buzz = "Buzz" if i % 5 == 0 else ''
        return "{}{}".format(fizz, buzz) or i

print(fizzbuzz_comprehension2(31))
