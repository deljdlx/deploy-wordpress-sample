echo "🟢 Project composer install"
composer install
if [ -d "vendor/Deljdlx/Deploy" ]; then
    echo "🟢 Deleting Deljdlx/Deploy vendor"
    rm -rf ./vendor/Deljdlx/Deploy
fi

if [ -d "vendor/Deljdlx/DeployWordpress" ]; then
    echo "🟢 Deleting Deljdlx/DeployWordpress vendor"
    rm -rf ./vendor/Deljdlx/DeployWordpress
fi


git clone git@github.com:deljdlx/deploy.git ./vendor/Deljdlx/Deploy
git clone git@github.com:deljdlx/deploy-wordpress.git ./vendor/Deljdlx/DeployWordpress

# ========================================================================================


echo ""
echo "=============================="
echo "=============================="
echo ""


echo "🟢 Installing wordpress"
dep scaffold development


if [ ! -f "public/.htaccess" ]; then
    echo "🟢 Creating .htaccess file and setting chmod"
    cd public && composer run activate-htaccess && composer run chmod && cd ..
fi