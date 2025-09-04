# Green-SKY
Green SKY app
npm install -g expo-cli eas-cli
cd GreenSkyApp
npm install
{
  "build": {
    "production": {
      "android": {
        "buildType": "app-bundle"
      }
    }
  }
}
eas build --platform android --profile production
