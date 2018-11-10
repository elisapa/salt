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

Poistin kansion ja palautin sen kloonaamalla.

	sudo rm -r /srv/salt
	cd /srv
	sudo git clone sudo git clone https://github.com/elisaparolo/salt.git

### d) Näytä omalla salt-varastollasi esimerkit komennoista ‘git log’, ‘git diff’ ja ‘git 
### blame’. Selitä tulokset.

	sudo git log
	commit 2279500b164c15fb1da9d4daa0dfd2d173634e96
	Author: Elisa Parolo <elisa.parolo@myy.haaga-helia.fi>
	Date:   Fri Nov 9 11:21:50 2018 +0000

	Otsikko korjattu

	commit 7d909c6a43c3ed5349854c21522591eb6c1557ed
	Author: Elisa Parolo <elisa.parolo@myy.haaga-helia.fi>
	Date:   Fri Nov 9 11:19:28 2018 +0000

	Raporttitiedoston formatointia paranneltu

	commit 1c6b301de40879ddbf3dbfbf386b13cd8662b107
	Author: Elisa Parolo <elisa.parolo@myy.haaga-helia.fi>
	Date:   Fri Nov 9 11:13:51 2018 +0000

	Tiedosto viikko3.md siirretty oikeaan kansioon

	commit aaff8f6d017dcb42677676ee079dc22235494311
	Author: Elisa Parolo <elisa.parolo@myy.haaga-helia.fi>
	Date:   Fri Nov 9 11:08:28 2018 +0000

	Lisätty user-kansio sekä sen sisällä oleva salt-moduuli

	commit e3e95af121a073ee03012c00f6bbf711a6e109f0
	Author: Elisa Parolo <elisa.parolo@myy.haaga-helia.fi>
	Date:   Tue Nov 6 15:10:13 2018 +0000

	Added a state for test purposes

	commit e2f7cbf7effb67ddfa0e6ff47ef6b93df3d2e628
	Author: elisaparolo <44803180+elisaparolo@users.noreply.github.com>
	Date:   Tue Nov 6 15:03:15 2018 +0000

	Initial commit

Tällä komennolla näkyvät committien lokitiedot aikajärjestyksessä niin, että viimeisin commit
on ensimmäisenä. Jokaisesta commitista näkee SHA1-tarkistussumman, commitin tekijä, päivä,
kellonaika sekä commit-viesti.
(https://git-scm.com/book/en/v2/Git-Basics-Viewing-the-Commit-History)

	sudo git diff

	diff --git a/user/viikko3.md b/user/viikko3.md
	index 5becc27..78696d8 100644
	--- a/user/viikko3.md
	+++ b/user/viikko3.md
	@@ -33,5 +33,9 @@ Koska moduli toimii, sen voi siirtää Gittiin.
        sudo git pull
        sudo git push
 
	+Poistin kansion ja palautin sen kloonaamalla.
 
	+       sudo rm -r /srv/salt
	+       cd /srv
	+       sudo git clone sudo git clone https://github.com/elisaparolo/salt.git

Tässä tapauksessa, komento näyttää miten viikko3.md -tiedostoa on muokattu ja mitä tiedostoon
on lisätty viime commit-komennolla.
Tulostuksen ensimmäinen rivi viittaa lähdetiedostoihin, joita verrataan. Toinen rivi sisältää
Gitin metadataa. Kolmas ja neljäs rivi ovat selityksiä tuleville tiedoille: rivit jotka
alkavat symbolilla "-" ovat muutoksia tiedostoon a/user/viikko3.md ja rivit jotka alkavat
symbolilla "+" viittaavat muutoksiin tiedostoon b/user/viikko3.md. @@-symbolien sisällä
on kooste muutoksista, tässä tapauksessa tiedoston riviltä 33 alkaen olen poistanut 5 riviä
ja samasta rivistä alkaen olen lisänyt 9 riviä. Nämä rivit näkyvät tulostuksessa.
(https://www.atlassian.com/git/tutorials/saving-changes/git-diff) 

	sudo git blame viikko3.md
	
	1c6b301d (Elisa Parolo      2018-11-09 11:13:51 +0000 25)         sudo mkdir user
	1c6b301d (Elisa Parolo      2018-11-09 11:13:51 +0000 26)         sudoedit init.sls
	1c6b301d (Elisa Parolo      2018-11-09 11:13:51 +0000 27)         sudo salt '*' 
	state.apply user
	7d909c6a (Elisa Parolo      2018-11-09 11:19:28 +0000 28) 
	1c6b301d (Elisa Parolo      2018-11-09 11:13:51 +0000 29) Koska moduli toimii, sen voi
	siirtää Gittiin.
	
Pieni kooste tulosteesta. Git blame -komennolla näkee kuka käyttäjä on viimeeksi muokannut
tiedoston jokaista riviä sekä muokkauksen päivämäärän ja kellonajan. Komennolla ei näe mitä
rivejä on poistettu tai muokattu.
(https://git-scm.com/docs/git-blame)

Päätän harjoituksen tekemisen 09/11/2018 klo 14.19
--------------
Jatkan harjoitusta 10/11/2018 klo 20.42. Ennen työskentelyä asensin tarvittavat ohjelmat ja kloonasin
repon oikeaan kansioon.

### Tee tyhmä muutos gittiin, älä tee commit:tia. Tuhoa huonot muutokset 
### ‘git reset –hard’. Huomaa, että tässä toiminnossa ei ole peruutusnappia.

Tein uuden kansion, jonne siirsin kaikki tiedostot /srv/salt/hello-kansiosta. Tämän jälkeen poistin 
kansion.

	cd /srv
	mkdir eraseall
	mv /srv/salt/hello /srv/eraseall
	rm -r /srv/eraseall
	sudo git add .
	sudo git reset --hard
	HEAD is now at 22f40bf Git log, diff ja blame selitykset lisätty tiedostoon viikko3.md

Viimeisestä komennosta tulostui viimeisin commit-viesti, ja kansio /srv/salt/hello oli palautunut
alkuperäiselle paikalleen.

### Tee uusi salt-moduli. Voit asentaa ja konfiguroida minkä vain uuden ohjelman: demonin, työpöytäohjelman
### tai komentokehotteesta toimivan ohjelman. Käytä tarvittaessa ‘find -printf “%T+ %p\n”|sort’
### löytääksesi uudet asetustiedostot.

Tein moduulin, joka asettaa näppäimistön kieleksi suomen, luo uuden käyttäjän, asentaa Apachen ja
enabloi käyttäjähakemistot sekä tarkistaa toimiiko käyttäjän kotisivut modulin ajamisen jälkeen.

	sudo mkdir apache
	sudoedit init.sls
	sudoedit default-index.html
	sudoedit userdefault.html
	sudo salt '*' state.apply apache 

Koska moduuli toimii, sen voi committaa gittiin. Ennen commit-komentoa loin uuden kansion, jonne
siirsin tämän raportin jotta repositorysta tulisi mahdollisimman selkeä.
	
	mkdir vk3_raportti
	sudo mv /srv/salt/user/viikko3.md /srv/salt/vk3_raportti/raportti.md
	sudo git add .
	sudo git commit
	sudo git pull
	sudo git push
