# script-create-repo
---

O objetivo desse script é criar um repositório no Github e configurar as rulesets abaixo:

1. Proibido deletar as branchs de referencia (develop e production)
2. E necessário uma PR antes de fazer o merge com as seguintes propriedades:
	- 1 aprovação é necessária para seguir com merge 
	- E necessário que as conversas sejam solucionadas  
	- O copilot vai realizar code review (influencia no 2.2)  
	- Squash e rebase não são aceitos somente merge  
3. Push direto nas branchs de referencia são bloqueados 


## Váriaveis que vão ser carregadas na execução do script

- `repo_name`:  nome do repositório que vai ser criado (importante seguir o padrão de nomenclatura disponiblizado na wiki)
- `org_name`:  nome da organização 
- `token_gh `: token do gh com os acesso de admin para conseguir criar as rulesets 
- `template`:  qual template vai ser utlizado (ex. backend, frontend, infra, etc)

### Observações 

```
gh repo create ${org_name}/${repo_name} --public --template ${org_name}/${template} --include-all-branches 
```

O comando acima para criar o repositório precisa do gh cli instalado e autenticado!





