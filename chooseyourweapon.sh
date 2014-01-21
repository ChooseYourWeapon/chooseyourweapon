#!/bin/bash
#
# <Choose Your Weapon version 0.0.2>
# Copyright (C) <2014> <Teslas Moustache>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>."


#================
# Art
#================

declare -a weapons
declare -A art

function art_for {
    local weapon="$*"

    weapons+=("$weapon")
    IFS='' read -r -d '' art["$weapon"]
}

art_for D-4 <<'EOF'
         ^
        /|\ 
       /'|:\ 
      /''|::\ 
     /'''|:::\ 
    /''''|::::\ 
   /''''/,\::::\ 
  /'''/,,,,,\:::\ 
 /''/,,,,,,,,,\::\ 
/'/,,,,,,,,,,,,,\:\ 
/_________________\ 
EOF

art_for D-6 <<'EOF'
 _______
| .   . |\  
|   .   |.\ 
| .   . |.'|
|_______|.'|
 \ ' .   \'|
  \____'__\|
EOF

art_for D-8 <<'EOF'
EOF

art_for D-10 <<'EOF'
EOF

art_for D-12 <<'EOF'
EOF

art_for D-20 <<'EOF'
        _=_
    .,:/   \:,.
  z/ ,;     3. \z
 <  /         \  >
(--<----------->--)
|  / \       / \  |
| /   \     /   \ |
|/     \   /     \|
(_______\,/_______)
 ~\      |      /~
   `\.   |   ./'
      \=_|_=/
         =
EOF

art_for D-100 <<'EOF'
EOF

art_for coin toss <<'EOF'
Feel like donating? 14ZcmYJCZKsUFDYfHdU7YEaAwkatLdBvVC

                 ,.=ctE55ttt553tzs.,
             ,,c5;z==!!::::  .::7:==it3>.,
          ,xC;z!::::::    ::::::::::::!=c33x,
        ,czz!:::::  ::;;..===:..:::   ::::!ct3.
      ,C;/.:: :  ;=c!:::::::::::::::..      !tt3.
     /z/.:   :;z!:::::J  :E3.  E:::::::..     !ct3.
   ,E;F   ::;t::::::::J  :E3.  E::.     ::.     \ttL
  ;E7.    :c::::F******   **.  *==c;..    ::     Jttk
 .EJ.    ;::::::L                   '|:.   ::.    Jttl
 [:.    :::::::::773.    JE773zs.     I:. ::::.    It3L
;:[     L:::::::::::L    |t::!::J     |::::::::    :Et3
[:L    !::::::::::::L    |t::;z2F    .Et:::.:::.  ::[13
E:.    !::::::::::::L               =Et::::::::!  ::|13
E:.    (::::::::::::L    .......       \:::::::!  ::|i3
[:L    !::::      ::L    |3t::::!3.     ]::::::.  ::[13
!:(     .:::::    ::L    |t::::::3L     |:::::; ::::EE3
 E3.    :::::::::;z5.    Jz;;;z=F.     :E:::::.::::II3[
 Jt1.    :::::::[                    ;z5::::;.::::;3t3
  \z1.::::::::::l......   ..   ;.=ct5::::::/.::::;Et3L
   \t3.:::::::::::::::J  :E3.  Et::::::::;!:::::;5E3L
    'cz\.:::::::::::::J   E3.  E:::::::z!     ;Zz37'
      \z3.       ::;:::::::::::::::;=       ./355F
        \z3x.         ::~=======          ,c253F
          'tz3=.                      ..c5t32^
             '=zz3==...         ...=t3z13P^
                 '*=zjzczIIII3zzztE3>*^'
EOF

#================
# Logic
#================

function roll {
NUMBER=$(( ( $RANDOM % $1 ) + 1 ))
}

#================
# User Interface
#================

clear

echo "A dice roller script for D-4, D-6, D-8, D-10, D-12, D-20, and D-100, as well as a coin tosser."
PS3="Choose your weapon: "

select weapon in "${weapons[@]}"; do 
    if [ -z "$weapon" ]; then
        echo "Unknown weapon"
        continue
    fi

    clear

    ART="${art[$weapon]}"
    [ -n "$ART" ] && echo "$ART"

    case "$weapon" in
        D-*)
            roll "${weapon:2}"

            echo "You have chosen $weapon. And you have rolled a...."
            echo $NUMBER
            ;;
        "coin toss")
            roll 2

            echo "You have tossed a coin. And it has landed on...."
            [ $NUMBER -eq 1 ] && echo "Heads" || echo "Tails"
            ;;
        *)
    esac
done
