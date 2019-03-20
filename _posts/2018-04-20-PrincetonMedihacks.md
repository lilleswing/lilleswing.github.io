---
layout: page
title:  "Google Cloud Platform for Princeton Medihacks"

---
In this tutorial I will walk through how to sign up for Google Cloud Platform and run a DeepChem enabled jupyter notebook.

To begin to to [https://cloud.google.com](https://cloud.google.com) and follow the signup wizard.  Note you must put in a credit card but the free tier is $300 of compute which is much more than you will spend in a single weekend.


Now it is time to spin up our virtual machine!

It might take a little bit for compute engine to "Get Ready"



The default instance is a little small to run DeepChem so we have to make some changes.
* 4 vCPU
* Ubuntu Linux 16.04 w/ 30GB disk
* Allow HTTP Traffic
* Allow HTTPS Traffic
* Add SSH key now if you wish

After the image comes up SSH into it using the web-terminal.


Now that we have access to the machine we will install DeepChem and start a jupyter notebook that we can access through our browser.

```bash
#!/bin/bash
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O anaconda.sh;
bash anaconda.sh -b
echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
git clone https://github.com/deepchem/deepchem.git
cd deepchem
bash scripts/install_deepchem_conda.sh deepchem
source activate deepchem
python setup.py develop
export JUPYTER=`which jupyter`
sudo $JUPYTER notebook --ip=0.0.0.0 --port=80 --allow-root
```

With that done you can now run through the notebooks by going in your browser to the external IP shown in google with the token showing up in your terminal!
