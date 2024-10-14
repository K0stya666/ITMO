plugins {
    id("java")
    id("application")
    id("com.github.johnrengelman.shadow") version "8.1.1"
//    kotlin("jvm") version "1.8.0"
//    application
}

group = "server"
version = ""

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(platform("org.junit:junit-bom:5.10.0"))
    testImplementation("org.junit.jupiter:junit-jupiter")

    // JSON-библиотека
    implementation("org.json:json:20230227")

    // Добавляем локальный .jar файл библиотеки для FastCGI
    implementation(files("src/main/resources/libs/fastcgi-lib.jar"))
}

tasks.test {
    useJUnitPlatform()
}

tasks.shadowJar {
    archiveBaseName.set("server")
    archiveClassifier.set("")
    archiveVersion.set(version.toString())

    manifest {
        attributes(
            "Main-Class" to "server.FastCGIServer"
        )
    }
}

tasks {
    build {
        dependsOn(shadowJar)
    }
}

java {
    sourceCompatibility = JavaVersion.VERSION_15
    targetCompatibility = JavaVersion.VERSION_15
}

application {
    // Указываем полное имя основного класса
    mainClass.set("server.FastCGIServer")
}

//tasks.jar {
//    manifest {
//        attributes["Main-Class"] = "server.FastCGIServer"
//    }
//
//    from(configurations.runtimeClasspath.get().map { if (it.isDirectory) it  else zipTree(it) })
//    duplicatesStrategy = DuplicatesStrategy.EXCLUDE
//}
