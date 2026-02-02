## Instructivo para levantar la aplicación.

1) Primero clonamos el repositorio a nuestro equipo local.
- git clone https://github.com/AlfreMu/Flask-Example.git

2) Ingresamos al directorio donde lo clonamos.
- cd Flask-Example

3) Hacer Docker Compose (asegurarse de tener el docker engine prendido).
- docker compose up -d

4) Abrir en el navegador: http://localhost:5000
- Tambien podemos probar alguna de las rutas:  http://localhost:5000/api

Si quisieramos levantarla con Kubernetes, debemos asegurarnos de tener la opcion de Kubernetes activada dentro de nuestro Docker Desktop, y aplicar los 3 manifiestos:

- kubectl apply -f k8s/namespace.yml
- kubectl apply -f k8s/deployment-flask.yml
- kubectl apply -f k8s/service-flask.yml

En este caso accederiamos desde http://localhost:30050, ya que esta definido en el service-flask.yml como nodePort: 30050.


---------------------------------------------------------------------------------------------------------------------------------------
[![Issues](https://img.shields.io/github/issues/jainamoswal/Flask-Example?style=for-the-badge&color=green)](https://github.com/jainamoswal/Flask-Example/issues)
[![Forks](https://img.shields.io/github/forks/jainamoswal/Flask-Example?style=for-the-badge&color=green)](https://github.com/jainamoswal/Flask-Example/fork)
[![Stars](https://img.shields.io/github/stars/jainamoswal/Flask-Example?style=for-the-badge&color=green)](https://github.com/jainamoswal/Flask-Example)
[![Size](https://img.shields.io/github/repo-size/jainamoswal/Flask-Example?style=for-the-badge&color=green)](https://github.com/jainamoswal/Flask-Example)
[![Contributors](https://img.shields.io/github/contributors/jainamoswal/Flask-Example?style=for-the-badge&color=green)](https://github.com/jainamoswal/Flask-Example)

---
| 🗺 Routes 🗺 | 🚧 Usage 🚧 | 
| :-: | :-: |
| `/api` | For API. |
| `/file` | For streaming files. |
| `/dl` | For downloading a file. |
| `/<name>` | Says Hello! 🤚 |
| `/code` | For redirection. |
| `/cookies/set` | For setting cookies. |
| `/cookies/get` | For retrieving cookies. |
| `/cookies/del` | For deleting cookies. |
| `/headers` | For working with Headers. |
| `/ip` | For location based user interface. |
| `/q` | For getting the parameters passed with URL. |

---
## How to use this ? 
- Don't be scared 😬 by watching a ton files, Most are just to configure the deploy settings. 🏋️‍♂️
- Star this repository. ⭐️
- Make a new repository by clicking [here.](https://github.com/jainamoswal/Flask-Example/generate) 👲
- Go to [modules folder](modules). 📂
- Add or modify the plugins. ✏️
- Crawl any hosting provider. 🕷
- Link your (Newly generated 🍽) repository with it. 🔗
- Deploy it there or replace your username [here](#deployments) and deploy using buttons. 🚀 
- And done. ✅

#### OR 
- Just [deploy](#deployments) this repository for testing. 🧪

### Deployments



<details><summary>Heroku.com 🚀</summary>
<br>

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/jainamoswal/Flask-Example)
</details>
 
<details><summary>Replit.com 🌀</summary>
<br>

[![Run on Repl.it](https://repl.it/badge/github/jainamoswal/Flask-Example)](https://repl.it/github/jainamoswal/Flask-Example)
</details>

<details><summary>Zeet.co 💪</summary>
<br>
 
[![Deploy](https://deploy.zeet.co/Flask-Example.svg)](https://deploy.zeet.co?url=https://github.com/jainamoswal/Flask-Example)
</details>

#### Adding some other hosting providers too 🤧 soon.




---

<details>
<summary>Support ground. ⛹️‍♂️🤝</summary>
<br>  
  
- [![Channel](https://img.shields.io/badge/Telegram-Channel-green?style=for-the-badge&logo=telegram)](https://t.me/J_projects)
- [![Support](https://img.shields.io/badge/Telegram-Group-green?style=for-the-badge&logo=telegram)](https://t.me/J_projects_chat)
</details>



<details>
<summary>Donate. 💰💷</summary>
<br>  
  
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jainamoswal) 
[![paypal](https://www.paypalobjects.com/webstatic/en_AU/i/buttons/btn_paywith_primary_s.png)](https://paypal.me/joswal105)
</details>



## License 
### [Flask-Example](https://github.com/jainamoswal/Flask-Example) is licensed under [IDC v1](https://github.com/jainamoswal/idc) or later.
[![idc](https://telegra.ph/file/e52d9b970e6967b3d6b6a.png)](https://github.com/jainamoswal/idc)

`This LICENSE is widely used when the owner of the content does not care what you do from the source.
No one can appeal copyright or DMCA takedown notices. The end user is free to do anything from the content. Nor the owners or distributors are affiliated with any crime done by the content of the LICENSE. `
