import 'package:gotraining/core/shared/functions/validators.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/core/utils/images/login_images.dart';
import 'package:gotraining/modules/login/stores/login_store.dart';
import 'package:gotraining/modules/preload/pages/preload_page.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    final loginStore = Provider.of<LoginStore>(context);
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          LoginImages.backgroundImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.1),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Form(
            key: loginStore.formKey,
            child: ListView(children: [
              Column(
                children: [
                  SizedBox(
                    width: 230,
                    height: 110,
                    child: Image.asset(
                      'assets/images/training.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Nome",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorsApp.colorItem),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorsApp.colorItem),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: Validatorless.multiple([
                        Validatorless.required("Nome obrigatorio"),
                        Validatos.nomeLogin('Nome invalido')
                      ]),
                      controller: loginStore.emailController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Senha",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorsApp.colorItem),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorsApp.colorItem),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: Validatorless.multiple([
                        Validatorless.required("Senha obrigatoria"),
                        Validatos.nomeLogin('Senha invalida')
                      ]),
                      controller: loginStore.senhaController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Esqueceu a senha?",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        Row(children: [
                          Checkbox(
                              value: loginStore.isChecked,
                              onChanged: (bool? value) =>
                                  loginStore.checkboxValue(
                                      loginStore.isChecked = value!)),
                          const Text("Lembre-me",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white))
                        ])
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 250,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (loginStore.verifyLogin(
                            loginStore.emailController.text,
                            loginStore.senhaController.text)) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const PreLoadPage()),
                          );
                        }
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "Entrar",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            ColorsApp.colorItem),
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
