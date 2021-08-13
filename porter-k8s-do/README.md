# playng-with-porter
Testing Porter capabilities (https://github.com/getporter)

Deploying kubernetes cluster from https://github.com/digitalocean/doks-example on DigitalOcean with Porter.

## Try it yourself:

1. Install porter (requires docker): 

   ```bash
    curl -L https://cdn.porter.sh/latest/install-mac.sh | bash 
   ```

   or

   ```bash
   curl -L https://cdn.porter.sh/latest/install-linux.sh | bash
   ```

2. Obtain DigitalOcean Access Token: https://docs.digitalocean.com/reference/api/create-personal-access-token/ and save it as env variable:

   ```bash
   export DO_ACCESS_TOKEN={your token}
   ```

   

3. Build CNAB bundle from sources:

   ```bash
   porter build
   ```

   

4. Add DigitalOcean token to credentials:

   ```
   porter credentials generate porter-k8s-do
   ```

   

5. You should be now ready to deploy the cluster

   ```bash
   porter install --cred porter-k8s-do
   ```

   

6. To uninstall:

   ```bash
   porter uninstall --cred porter-k8s-do
   ```



Porter documentation: https://porter.sh/install/

