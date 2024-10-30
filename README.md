
## Reproduction Environment

### Rancher
| Component           | Version / Type |
| ------------------- | -------------- |
| Rancher version     | v2.9.2         |
| Installation option | Docker         |
| Docker version      | v27.1.1        |
| Logged in user role | Admin          |

### Linode instance
| Component      | Version / Type   |
| -------------- | ---------------- |
| OS             | Ubuntu 24.04 LTS |
| Docker version | v26.0.2          |

## Reproduction steps

1. Create a Linode Cluster with RKE:
`````
$ rke config --name cluster.yml
$ rke up
`````
2. Run rancher v2.9.2 locally (used docker installation option for this reproduction)
3. Import the cluster into rancher
4. Stop the rancher container
5. Run the cleanup script

#### Outcome:
````
$ sh user-cluster.sh rancher/rancher-agent:v2.9.2 -dry-run
serviceaccount/cattle-cleanup-sa created
clusterrolebinding.rbac.authorization.k8s.io/cattle-cleanup-binding created
job.batch/cattle-cleanup-job created
clusterrole.rbac.authorization.k8s.io/cattle-cleanup-role created
time="2024-10-30T13:43:58Z" level=warning msg="failed to reconcile kubelet, error: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?"
time="2024-10-30T13:43:58Z" level=info msg="Starting cluster cleanup"
time="2024-10-30T13:43:58Z" level=info msg="Listening on /tmp/log.sock"
time="2024-10-30T13:43:58Z" level=fatal msg="checking for cattle-system/rancher service: services \"rancher\" is forbidden: User \"system:serviceaccount:default:cattle-cleanup-sa\" cannot get resource \"services\" in API group \"\" in the namespace \"cattle-system\""
serviceaccount "cattle-cleanup-sa" deleted
clusterrolebinding.rbac.authorization.k8s.io "cattle-cleanup-binding" deleted
job.batch "cattle-cleanup-job" deleted
clusterrole.rbac.authorization.k8s.io "cattle-cleanup-role" deleted
````