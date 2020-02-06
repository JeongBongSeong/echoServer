import csv
import json

csvfile = open('input.csv', 'r')
jsonfile = open('git_comment.json', 'w')

fieldnames = ("Author","Message")
reader = csv.DictReader( csvfile, fieldnames)
jsonfile.write('[\n')
for row in reader:
    jsonfile.write('\t')
    json.dump(row,jsonfile)
    jsonfile.write('\n')
jsonfile.write(']\n')
