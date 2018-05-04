# qtumcore-docker
Docker Repo for Qtum.

## Usage Instructions

**Mandatory Requirement**: Must use a local mount volume and config file.

Example:

```
sudo docker run -it --name=qtumcore-docker \   
-v /path/to/local/qtumcore/dir:/opt/qtumcore \   
-p 127.0.0.1:3888:3888  kp666/qtumcore:latest
```

**Config file is read from**: `/opt/qtumcore/qtum.conf`, i.e., `/path/to/local/qtumcore/dir/qtum.conf`

##Storing of Data

You can store data within `/opt/qtumcore/data` or any directory within `/opt/qtumcore`.

This will inturn store your data within `/path/to/local/qtumcore/dir` described above. 

Hence, to store within a different local dir, create a hard symlink for any other directory inside `/path/to/local/qtumcore/dir` and then use that directory as `datadir` in `qtum.conf`

###Example

If your host directory is `/usr/local/qtumcore` and want to store data in `/var/qtumcore`, do the following:

```
mkdir -p /usr/local/qtumcore
mkdir -p /var/qtumcore
ln -s /var/qtumcore /usr/local/qtumcore/data
```

and use `/opt/qtumcore/data` as your data dir inside the `qtum.conf`

```
#qtum.conf
datadir=/opt/qtumcore/data
