#Shows how many of each is breed are in shelters
a = 10
b = 7
c = 0

c = a + b
print "Number of pugs in shelters : ", c

c = a - b
print "Number of labradores in shelters : ", c

c = a * b
print "Number of chihuahuas in shelters : ", c

c = a / b
print "Number of golden retrievers in shelters : ", c

c = a % b
print "Number of poodles in shelters : ", c


a = 2
b = 3
c = a**b 
print "Number of bulldogs in shelters : ", c


a = 10
b = 5
c = a//b 
print "Number of great danes in shelters : ", c


#Run list of breeds in shelter
typeOfDog = ['Labradores','golden retrievers','chihuahuas', 'pugs', 'poodles', 'bulldogs','great danes']
for i in range(len(typeOfDog)):
    print('I like', typeOfDog[i])
    
#AdoptMe Dictionary     
adopt_me = {
    'chihuahua': ['Shadow', 'male', 7],
    'golden retriever': ['Roxy', 'female', 2.5],
    'labradore': ['Joy', 'female',  6.5],
    'pug': ['Baxter', 'male', 2],
    'poodle' : ['Frannie','female', 3,],
    'bulldog' : ['Vince', 'male', 6],
    'great dane' : ['Billy', 'male', 2]
    }

       
def searchDogs(dogBreed):
    #Looks up potential dogs for adoption

    try:
        #Tries the following lines of texts and if no errors then it runs
        dogInfo = adopt_me[dogBreed]
        print 'Breed:' + dogBreed.title()
        print 'Name:' + dogInfo[0]
        print 'Gender:' + dogInfo[1]
        print 'Age:' + str(dogInfo[2])
        adoptAsk(dogBreed)
    except:
        #If there are errors, then this code will run.
        print 'No dogs found by that breed'
        searchAgain

        
def adoptAsk(dogBreed):
    pick = raw_input("Would you like to adopt me? y/n:").lower()
    if pick == "n":
        print ("Okay, I understand")
        stop = False
    if pick == "y":
        print ("Yay!, please contact {} for where to pick me up!").format('555-874-9872')
        stop = False
        
userWantsMore = True
while userWantsMore == True:
    #Asks user to input dog breed
    dogBreed = raw_input('Please pick a breed from above:').lower()
    #run new function searchDogs and adoptAsk
    searchDogs(dogBreed) 
    userWantsMore = False
#See if user wants to search again
    searchAgain = raw_input('Search again? (y/n)').lower()
    if searchAgain == 'y':
        #userWantsMore stays as true so loop repeats
        userWantsMore = True
    elif searchAgain == 'n':
        #userWantsMore turn to false to stop loop
        userWantsMore = False
        print ("\nThanks for checking in, stop by again soon!")
    else:
        #user inputs an invalid response, so the program quits
        print "I don't understand what you mean, quitting"
        userWantsMore = False
        

