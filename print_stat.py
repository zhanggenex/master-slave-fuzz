from __future__ import print_function

fall = open("all_stats")

item_many = []
for i in range(0, 40):
	item_many.append([])
item_dict = {}
cnt = 0

for line in fall:
	if line.split(":")[0] not in item_dict:
		item_dict[line.split(":")[0]] = cnt
		item_many[cnt].append(line.split(":")[1].split("\n")[0])
		cnt += 1
	else:
		item_many[item_dict[line.split(":")[0]]].append(line.split(":")[1].split("\n")[0])

#print ("fuzzer_name       \tfuzzer1\tfuzzer2\tfuzzer3\tfuzzer4\tmaster")

new_item = []
for i in range(0, 5):
	new_item.append(float(item_many[4][i].split()[-1])/(float(item_many[1][i].split()[-1]) - float(item_many[0][i].split()[-1])))

for i in item_dict:
	print (i, end = "\t")
	for j in item_many[item_dict[i]]:
		if i == "command_line      ":
			print (" ", end = "")
			print (j.split()[0].split("/")[-1], end = "\t")
		else:
			print (j, end = "\t")
	print ("")

print ("average_speed     ", end = "\t")
for i in new_item:
	print (" ", end = "")
	print ("%.2f" % i, end = "\t")
print("")

fall.close()
