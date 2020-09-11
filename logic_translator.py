raw_data = open('/Users/Emily/relearningprogramming2020/MachineLearning/MyExamples/sentences.txt', 'r')
sentences = []
for line in raw_data.readlines():
    sentences.extend(line.split(' '))

translations = []
for s in sentences:
    this_translation = []
    for c in s:
        if c is 'A' or c is 'B' or c is 'C' or c is 'D':
            this_translation.append(0)
        elif c is '~':
            this_translation.append(1)
        elif c is '*' or c is 'v' or c is '>':
            this_translation.append(2)
        elif c is '(':
            this_translation.append(3)
        elif c is ')':
            this_translation.append(4)
    if this_translation:
        translations.append(this_translation)

'''
# Only run once!
new_file = open('/Users/Emily/relearningprogramming2020/MachineLearning/MyExamples/translations.txt', 'x')
new_file.close()

# Only run once! 
new_file = open('/Users/Emily/relearningprogramming2020/MachineLearning/MyExamples/translations.txt', 'w')    
for t in translations:
    for c in t:
        new_file.write(str(c))
        new_file.write(' ')
    new_file.write('\n')
new_file.close()
'''
