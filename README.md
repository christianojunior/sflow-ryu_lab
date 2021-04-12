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

# Para mais informações

Site oficial do mininet:  
http://mininet.org/  
Site do sFlow-rt, com outras aplicações para download disponiveis:  
https://sflow-rt.com/download.php  
Site oficial do RYU:  
https://ryu-sdn.org/  
Blogpost no qual este repositorio foi baseado:  
https://blog.sflow.com/2018/10/ryu-measurement-based-control.html  
