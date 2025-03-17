<a id="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/github_username/repo_name">
    <img src="readme/logo.jpg" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Enemy</h3>

  <p align="center">
    Questa repository consiste in una serie di progetti Godot incentrati sulla creazione di nemici di un videogioco RPG in stile pixel art.
    <br />
    <br />
    Questa repository fa riferimento alla sezione "<em>Enemy</em>" del capitolo "<em>Godot</em>" del materiale didattico dal titolo "<em>Cosa si cela dietro ai pixel: imparare a programmare sviluppando un RPG</em>"
    <br />
    <a href="https://github.com/CarlinoCalogero/cosa-si-cela-dietro-ai-pixel.git"><strong>Esplora il materiale didattico »</strong></a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Indice</summary>
  <ol>
    <li>
      <a href="#cosa-si-cela-dietro-ai-pixel-imparare-a-programmare-sviluppando-un-rpg">Cosa si cela dietro ai pixel: imparare a programmare sviluppando un RPG</a>
    </li>
    <li>
      <a href="#riguardo-questa-repository">Riguardo questa repository</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisiti">Prerequisiti</a></li>
        <li><a href="#installazione">Installazione</a></li>
      </ul>
    </li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## Cosa si cela dietro ai pixel: imparare a programmare sviluppando un RPG
Il materiale didattico *"Cosa si cela dietro ai pixel: imparare a programmare sviluppando un RPG"* è un modo creativo per introdurre alla programmazione i principianti, tramite un manuale e codice di esempio, basati su un videogioco in uscita su Steam.

Ciascun capitolo si apre con una scena del gioco completato, la quale viene analizzata al fine di scomporla in componenti che saranno poi oggetto di sviluppo.

Il manuale fornisce repository iniziali e finali per ogni capitolo, facilitando l'apprendimento pratico. 

I concetti di programmazione sono introdotti gradualmente, con esempi e casi d'uso, come nel caso della spiegazione di variabili e scope durante la creazione del player.

<p align="right">(<a href="#readme-top">torna su</a>)</p>

## Riguardo questa repository
Questa repository consiste in una serie di progetti Godot incentrati sulla creazione di nemici di un videogioco RPG in stile pixel art e fa riferimento alla sezione "*Enemy*" del capitolo "*Godot*" del materiale didattico dal titolo "*Cosa si cela dietro ai pixel: imparare a programmare sviluppando un RPG*".

Questa repository include tre cartelle:
* `start/`, che contiene il progetto `Enemy [Start]`, ovvero, il progetto di partenza per l'implementazione dei nemici del videogioco
* `end/`, che contiene il progetto `Enemy [End]`, ovvero, il progetto con dei nemici funzionanti, in grado di girovagare a zonzo per la mappa, "vedere" il player e in caso avvicinarsi o allontanarsi da esso
* `exercise/`, che contiene il progetto `Enemy [Exercise]`, ovvero, il progetto di partenza per lo svolgimento degli esercizi

<p align="right">(<a href="#readme-top">torna su</a>)</p>

### Built With
* [![Godot][Godot]][Godot-url]

<p align="right">(<a href="#readme-top">torna su</a>)</p>

<!-- GETTING STARTED -->
## Getting Started
Questa sezione vi guiderà attraverso i passaggi fondamentali per configurare e avviare il progetto Godot presente in questa repository.

<p align="right">(<a href="#readme-top">torna su</a>)</p>

### Prerequisiti
Prima di iniziare, assicurati di avere i seguenti software installati:
* [Godot Engine 4.1.3](https://godotengine.org/download/archive/4.1.3-stable/): questo progetto è stato creato e testato con questa versione specifica. L'utilizzo di versioni diverse potrebbe causare problemi di compatibilità.

<p align="right">(<a href="#readme-top">torna su</a>)</p>

### Installazione
1. Clonare la repository
   ```sh
   git clone https://github.com/rpg-course-godot/05-godot-project-enemy.git
   ```
2. Aprire Godot 4.1.3
3. Cliccare su **Import**
4. Selezionare dal file picker di Godot il file **project.godot** presente all'interno della cartella della repository
5. Cliccare su **Import & Edit**

<p align="right">(<a href="#readme-top">torna su</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Godot]: https://img.shields.io/badge/Godot%20Engine%204.1.3-20232A?style=for-the-badge&logo=godotengine
[Godot-url]: https://godotengine.org/
