import hashlib,time,requests,json
import configparser
def get_node():
    cf = configparser.ConfigParser()
    cf.read("worker.conf")
    NODE = cf.get("server", "node")
    SERVER = cf.get("server", "api")
    TOKEN = cf.get("server", "token")
    return NODE,TOKEN,SERVER
def get_connection():
    cf = configparser.ConfigParser()
    cf.read("worker.conf")
    progress = int(cf.get("progress", "connection"))
    return progress
def get_progress():
    cf = configparser.ConfigParser()
    cf.read("worker.conf")
    progress = int(cf.get("progress", "count"))
    return progress
def get_access(TOKEN,time):
    return hashlib.md5(('novel_'+TOKEN+str(time)).encode()).hexdigest()
def getdata(name,data):
    NODE,TOKEN,SERVER = get_node()
    times = int(time.time())
    try:
        data = requests.post(SERVER,{'action':name,'data':json.dumps(data),'node':NODE,'token': get_access(TOKEN,times), 'time':times})
        data = data.text
    except:
        data = {}
    #print(data)
    try:
        data = json.loads(data)
    except:
        data = []
    return data
def update_job(status,percent,last,id):
    data = getdata('job_status',{'id':id,'status':status,'last':last,'percent':percent})