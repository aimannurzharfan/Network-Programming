from flask import Flask
from flask import render_template
import os

app = Flask(__name__)

# data paths
here = os.path.dirname(__file__)
data_dir = os.path.join(here, "data")
configs_dir = os.path.join(data_dir, "configs")

@app.route("/")
def main():
    # read sysinfo
    sysinfo_path = os.path.join(data_dir, "sysinfo.txt")
    if os.path.exists(sysinfo_path):
        f = open(sysinfo_path)
        sysinfo = f.read()
        f.close()
    else:
        sysinfo = "No system info yet."

    # read configs
    configs = {}
    if os.path.exists(configs_dir):
        for name in os.listdir(configs_dir):
            if name.endswith(".txt"):
                path = os.path.join(configs_dir, name)
                f = open(path)
                configs[name] = f.read()
                f.close()

    return render_template("index.html", sysinfo=sysinfo, configs=configs)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
