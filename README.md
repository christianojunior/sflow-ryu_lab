# Introdução
Esse é um repositorio que armazena a documentação e os arquivos necessários para a realização deste laboratorio, o objetivo deste laboratorio é demonstrar em ação a interação entre a sflow-rt engine e um SDN baseado em openflow(neste caso ryu), de forma a detectar um trafego incomum(neste caso um ataque DDOS por parte de um dos hosts da rede) e impedi-lo de afetar a infraestrutura, com o suporte do programa MININET para a emulação dos switches e hosts.

# Dependencias
- git
- vagrant

# instruções

```
git clone https://github.com/christianojunior/sflow-ryu_lab.git
```
Vá para a pasta resultante, dentro dela rode o comando
```
vagrant up
```
Aguarde alguns minutos enquanto o vagrant baixa a imagem do repositorio, e provisiona a mesma.
Quando o processo terminar, você deverá utilizar o comando 
```
vagrant ssh
```
Para iniciar uma sessão ssh com a maquina, faça isso em 3 terminais, um para rodar o mininet, e os outros dois para os containers do sflow e do ryu(para poder ver o logging da comunicação entre os mesmos durante o teste).
obs: assim como o vagrant up, vagrant ssh somente funciona se na pasta onde o vagrantfile se encontra.

Na maquina, no primeiro terminal rode nesta ordem
```
docker run -it -p 8080:8080 -p 6653:6653 --net docker_network --ip 172.18.0.6 chrischapouto/ryu-manager_machine:1.0
```
Segundo terminal
```
docker run -it -p 8008:8008 -p 6343:6343 --net docker_network --ip 172.18.0.5 chrischapouto/sflowrt_machine:1.0
```
Terceiro terminal
```
sudo mn --custom working_directory/sflow.py --topo tree,depth=2,fanout=4 --switch=ovsk --mac --link tc,bw=10,delay=5ms --controller=remote,ip=172.18.0.6
```
Ao rodar esse comando o mininet inicializara sua infraestrutura(você pode mudar os argumentos se assim desejar, deste comando os unicos argumentos obrigatorios são  --controller=remote,ip=172.18.0.6 e --custom working_directory/sflow.py)

Enquanto que na sessão mininet rode 
```
h1 hping3 --flood --udp -k -s 53 h3
```
Esse comando realizara um ataque flood, que será detectado e lidado com via mudança nas flow tables.
Para observar isso basta acessar ipdasuamaquinavirtual:8008/app/mininet-dashboard/html/index.html
# Para mais informações

Site oficial do mininet:  
http://mininet.org/  
Site do sFlow-rt, com outras aplicações para download disponiveis:  
https://sflow-rt.com/download.php  
Site oficial do RYU:  
https://ryu-sdn.org/  
Blogpost no qual este repositorio foi baseado:  
https://blog.sflow.com/2018/10/ryu-measurement-based-control.html  
