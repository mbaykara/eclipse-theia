poc for eclipse theia ide

Eclipse Che is an open-source, Java-based developer workspace server and Online IDE.
Eclipse Che runs on Cloud as well as locally.

Below is a local installation via `minikube as single Kubernetes node`
#### 1. Install minikube
see for other distro [here](https://minikube.sigs.k8s.io/docs/start/)
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
```
Start minikube with following command
```
minikube start --addons=ingress --vm=true --memory=8192
```
Customizing Che environment creating by custom Stack with following steps

For detailed documemtation [here](https://www.eclipse.org/che/docs/che-7/administration-guide/building-custom-registry-images/)
1. Create custom registry image:
Here development container will be registred as well as the workspace based on a git repository.
2. Create custom plugin registry image: 
Here any custom visual studio code plugin can be installed by providing corresponding plugin registry image.
3. Create custom cluster file
see for detailed options [here](https://www.eclipse.org/che/docs/che-7/installation-guide/configuring-the-che-installation/)
```
eclipse-theia$ tree
├── che-devfile-registry
│   ├── build.sh
│   ├── devfiles
│   │   ├── runtime
│   │   │   ├── devfile.yaml
│   │   │   └── meta.yaml
│   ├── images
│   │   ├── mosaiq.svg
├── custom.yaml
├── Dockerfile
└── README.md
```
```
chectl server:deploy  --che-operator-cr-patch-yaml=custom.yaml --platform minikube
```

export Certificate for browser
```
chectl cacert:export
```

```
--che-operator-cr-patch-yaml
devfileRegistryImage = yourCustomImage
```
Che uses two registry
* plug-ins registry
* devfile registry
