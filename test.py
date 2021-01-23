principle = 55000
I = 15
y = 5
count = 1
TotalAmount =660000
while count < y:
    print("principle amount is " + str(principle))
    print("counter is " + str(count))
    IR = principle * I / 100
    print("IRate is " + str(IR))
    principle = IR + principle
    count += 1
    print(principle, count)
    TotalAmount = TotalAmount + (principle * 12)
    print("Total Amount for " + str(count) + " is " + str(TotalAmount))

print(principle)
