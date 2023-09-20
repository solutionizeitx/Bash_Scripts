# need to run below commented command 1 time
# git config credential.helper store
# git config --global credential.helper cache

sudo git fetch --all

echo "fetching data"

sudo git reset --hard origin/main

echo "Resetting.."

sudo python manage.py migrate

echo "Migrating..."

echo "Done rest git from main"
