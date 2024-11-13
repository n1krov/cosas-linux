@echo off

echo ----------------------------------------------------
echo Script de instalacion de dependencias de desarrollo
echo ---------------Hecho por Karin----------------------


cls
echo Instalando yarn...
npm install -g yarn

cls
echo Instalando lerna...
npm install -g lerna

cls
echo Navegando al directorio del frontend...
cd packages\frontend

cls
echo Instalando dependencias de React...
npm install react@latest react-dom@latest
yarn add react@latest react-dom@latest
yarn add -D @types/react @types/react-dom
yarn add axios

cls
echo Instalando Tailwind CSS y herramientas relacionadas...
yarn add -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
yarn add -D daisyui@latest

cls
echo Agregando FontAwesome...
yarn add @fortawesome/fontawesome-free

cls
echo Instalando dependencias adicionales...
yarn install

cls
echo Navegando al directorio del backend...
cd ..\backend

cls
echo Instalando dependencias de backend...
yarn add nodemon --dev
yarn add bcryptjs
yarn add mongoose
yarn add jsonwebtoken
yarn install

cls
echo Instalacion completada
pause

