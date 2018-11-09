# Parolo Elisa
# Palvelinten hallinta, viikko 3
# Git ja Salt-moduulit

Aloitin tehtävän tekemisen 09/11/2018 klo 12.05.
Teen tehtävät USB-tikulta käynnistyvän Ubuntu 16.04.5 -käyttöjärjestelmällä.

### 1- Laita /srv/salt/ gittiin. Tee uusi moduli. Kloonaa varastosi toiselle koneelle (tai poista
### /srv/salt ja palauta se kloonaamalla) ja jatka sillä.


        sudo apt-get update
        sudo apt-get upgrade
        sudo apt-get -y install git
"Salt"-niminen repository on jo olemassa GitHubissani. Importaan sen /srv -kansioon.

        sudo cd /srv
        sudo git clone https://github.com/elisaparolo/salt.git
        sudo cd salt

Tein moduulin, joka luo uuden käyttäjän, poistaa Libreoffice-paketin sekä kaikki sen mukana 
tulleet ylimääräiset riippuvuudet.
Ennen komentojen ajamista asensin ja konfiguroin Salt masterin ja minionin. 

        sudo mkdir user
        sudoedit init.sls
	sudo salt '*' state.apply user

Koska moduli toimii, sen voi siirtää Gittiin.

	sudo git add .
	sudo git commit
	sudo git pull
	sudo git push



