# script-create-repo
---

O objetivo desse script é criar um repositório no Github e configurar as rulesets abaixo:

1. Proibido deletar as branchs de referência (develop e main)
2. E necessário uma PR antes de fazer o merge com as seguintes propriedades:
	- 1 aprovação é necessária para seguir com merge 
	- É necessário que as conversas sejam solucionadas  
	- `Squash` e `rebase` não são aceitos somente`merge`  
3. Push direto nas branchs de referência são bloqueados 


## Váriaveis que vão ser carregadas na execução do script

- `repo_name`:  Nome do repositório que vai ser criado (importante seguir o padrão de nomenclatura disponiblizado na wiki)
- `org_name`:  Nome da organização 
- `token_gh `: Token do gh com os acesso de admin para conseguir criar as rulesets 
- `template`:  Qual template vai ser utlizado (ex. backend, frontend, infra, etc)

### Observações 

```
gh repo create ${org_name}/${repo_name} --public --template ${org_name}/${template} --include-all-branches 
```

- O comando acima cria o repositório no github através do gh cli, em função disso será necessária autenticação.
	- doc de referencia autenticação gh cli: https://cli.github.com/manual/gh_auth_login 

- Para criar a ruleset é utilizado curl, para se autenticar é necesário token do github. 

