import yaml
d = yaml.safe_load(open('stack.yaml'))

if not d.get('volumes'):
    d['volumes'] = {}
s = d['services']
for i in s:
    v = s[i]
    if v.get('volumes'):
        vv = v['volumes'] 
        vvv = []
        for k in vv:
            if "DATA_DIRECTORY" in k.get('source', ""):
                vvv.append(f"{k['target'].replace('/', '-').replace('.', '-')}:{k['target']}" + (":ro" if k.get('read_only') else "" ))
                d['volumes'][k['target'].replace('/', '-').replace('.', '-')] = {'driver': 'local'}
        d['services'][i]["volumes"] = vvv
    
with open('stack2.yml', 'w') as outfile:
    yaml.dump(d, outfile, default_flow_style=False)