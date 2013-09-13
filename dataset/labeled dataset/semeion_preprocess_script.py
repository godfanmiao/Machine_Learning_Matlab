f = open('semeion.data')

while True:
    line = f.readline()
    if not line:
        break
    # print line.strip('\n')
    tuple = line.split(' ')
    # print len(tuple)
    print tuple[265]