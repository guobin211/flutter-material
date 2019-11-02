# 构建打包

## 生成sign

```bash
    //生成sign.jks
    keytool -genkey -v -keystore ~/sign.jks -keyalg RSA -keysize 2048 -validity 10000 -alias sign
    //--------------------------生成文件路径--------------------------------------------------别名--

    //查看证书SHA1
    keytool -list -v -keystore sign.jks -alias sign -storepass android -keypass 123456

    //-keystore sign.jks
    //-alias sign
    //-storepass android
    //-keypass 123456
```

## Android Studio文件配置

##### 1. 在Flutter工程中/android/app/key/sign.jks创建该目录。要在app目录下创建key文件夹，然后把sign.jks拖进来
##### 2. 在Flutter工程中/android/key.properties创建该文件。里面内容如下:

```bash
    storePassword=android
    keyPassword=123456
    keyAlias=sign
    storeFile=key/sign.jks

```

##### 3. 配置/android/app/build.gradle文件

```bash
    def keystorePropertiesFile = rootProject.file("key.properties")
    def keystoreProperties = new Properties()
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))

    android {
        signingConfigs {
            release {
                keyAlias 'sign'
                keyPassword 'android'
                storeFile file('key/sign.jks')
                storePassword 'android'
            }
        }

        buildTypes {
            release {
                // TODO: Add your own signing config for the release build.
                // Signing with the debug keys for now, so `flutter run --release` works.
                signingConfig signingConfigs.release
            }
        }
    }
```
