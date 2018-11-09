gittester:
  user.present:
    - fullname: Git Tester
    - shell: /bin/bash
    - groups:
      - sudo

libreoffice-common:
  pkg.purged

autoremove:
  cmd.run:
    - name: "sudo apt autoremove"
