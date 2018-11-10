fi:
  keyboard.system

apachetester:
  user.present:
    - fullname: Apache Tester
    - shell: /bin/bash
    - groups:
      - sudo

apache2:
  pkg.installed

/var/www/html/index.html:
 file.managed:
   - source: salt://apache/default-index.html

/etc/apache2/mods-enabled/userdir.conf:
 file.symlink:
   - target: ../mods-available/userdir.conf

/etc/apache2/mods-enabled/userdir.load:
 file.symlink:
   - target: ../mods-available/userdir.load

/home/apachetester/public_html/index.html:
  file.managed:
    - source: salt://apache/userdefault.html
    - makedirs: True

apache2service:
 service.running:
   - name: apache2
   - watch:
     - file: /etc/apache2/mods-enabled/userdir.conf
     - file: /etc/apache2/mods-enabled/userdir.load

test_userhtml:
  http.query:
    - name: 'http://localhost/~apachetester'
    - status: 200
