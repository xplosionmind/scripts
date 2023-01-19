#! /bin/bash

cd /home/admin/tommi.space;
sudo git pull;
ELEVENTY_ENV=production;
npm run build || npm run build && sudo rm -rf /var/www/my_webapp/www && sudo mv /home/admin/tommi.space/www /var/www/my_webapp/www -vf && echo -e "\n\n\nWEBSITE SUCCESSFULLY UPDATED!\n\n\n";

# Deploy Gemini website
titan;