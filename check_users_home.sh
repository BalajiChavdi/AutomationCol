users="user1
user2
user3
user4
"

home_found=
account_found=
for u in $users; do

  echo "User: $u"
  if `id $u > /dev/null 2>&1`; then
     account_found=1
  else
     account_found=0
  fi

  cd /homes/$u
  if `df . |grep home |grep '10.50.20' > /dev/null`; then
     home_found=1
  else
     home_found=0
  fi

  if [ $account_found -eq 0 ]; then
     echo "==> Missing Account"
  elif [ $home_found -eq 0 ]; then
     echo "==> Missing Home"
  else
     echo "==> PASS"
  fi
done



# --------Output-------- #

# User: user1
# ==> PASS
# User: user2
# ==> PASS
# User: user3
# ==> PASS
# User: user4
# ==> PASS
# User: user5
# ==> PASS
