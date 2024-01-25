import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final _contactForm = GlobalKey<FormState>(debugLabel: "contact-form");

class FooterContactForm extends StatefulWidget {
  const FooterContactForm({super.key});

  @override
  State<FooterContactForm> createState() => _FooterContactFormState();
}

class _FooterContactFormState extends State<FooterContactForm> {
  bool willAlwaysValidate = false;

  String? userName;

  String? userEmailAddress;

  String? userMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _contactForm,
        autovalidateMode: willAlwaysValidate ? AutovalidateMode.always : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactDetailsInputField(
              key: const Key("name-input-field"),
              helpText: "Name (Jane Doe)",
              placeHolder: "Name",
              keyboardType: TextInputType.name,
              validator: (name) {
                if (name == null) {
                  return "The name field is required.";
                }

                if (name.length < 3) {
                  return "The name is too short. It should have at least 2 letters.";
                }
                return null;
              },
              onChange: (name) {
                if (mounted) {
                  setState(() {
                    userName = name;
                  });
                }
              },
            ),
            ContactDetailsInputField(
              key: const Key("email-input-field"),
              helpText: "Email (janed@example.com)",
              placeHolder: "Email",
              inputFormatters: const [],
              keyboardType: TextInputType.emailAddress,
              validator: (email) {
                if (email == null) return 'Enter a valid email address';

                return !EmailValidator.validate(email)
                    ? 'Enter a valid email address'
                    : null;
              },
              onChange: (email) {
                if (mounted) {
                  setState(() {
                    userEmailAddress = email;
                  });
                }
              },
            ),
            MessageTextInputField(
              key: const Key("message-input-field"),
              onChange: (message) {
                if (mounted) {
                  setState(() {
                    userMessage = message;
                  });
                }
              },
            ),
            ContactFormSubmitBtn(
              onPressed: () {
                ///
                if (mounted) {
                  setState(() {
                    willAlwaysValidate = true;
                  });
                }

                ///
                if (_contactForm.currentState!.validate()) {
                  debugPrint(
                      "NAME: $userName , EMAIL: $userEmailAddress , MESSAGE: $userMessage");

                  Future.delayed(const Duration(seconds: 7), () {
                    if (mounted) {
                      setState(() {
                        willAlwaysValidate = false;
                      });
                    }
                    _contactForm.currentState!.reset();
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class ContactDetailsInputField extends StatefulWidget {
  final String helpText;
  final String placeHolder;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;
  final List<TextInputFormatter>? inputFormatters;

  const ContactDetailsInputField({
    super.key,
    required this.helpText,
    required this.keyboardType,
    required this.placeHolder,
    this.inputFormatters,
    required this.validator,
    required this.onChange,
  });

  @override
  State<ContactDetailsInputField> createState() =>
      _ContactDetailsInputFieldState();
}

class _ContactDetailsInputFieldState extends State<ContactDetailsInputField> {
  final _textInputController = TextEditingController();

  final FocusNode _focus = FocusNode();

  bool inputHasFocus = false;
  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (mounted) {
      setState(() {
        inputHasFocus = _focus.hasFocus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        key: Key("${widget.placeHolder}TextFormField"),
        focusNode: _focus,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        onChanged: widget.onChange,
        decoration: InputDecoration(
          hintText: inputHasFocus ? "" : widget.placeHolder,
          helperText: inputHasFocus ? widget.helpText : '',
          fillColor: Colors.grey.shade200,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    _textInputController.dispose();
  }
}

class MessageTextInputField extends StatelessWidget {
  final void Function(String?)? onChange;
  const MessageTextInputField({
    super.key,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: double.infinity,
        child: TextFormField(
          key: const Key("MessageTextFormField"),
          keyboardType: TextInputType.multiline,
          onChanged: onChange,
          minLines: 5,
          maxLines: 30,
          maxLength: 1000,
          decoration: InputDecoration(
            hintText: 'Enter your message here...',
            filled: true,
            fillColor: Colors.grey.shade200,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
      ),
    );
  }
}

class ContactFormSubmitBtn extends StatelessWidget {
  final void Function()? onPressed;
  const ContactFormSubmitBtn({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    const _ = MaterialStateProperty.all;
    return TextButton(
      style: ButtonStyle(
        shape: _(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        backgroundColor: _(
          const Color.fromRGBO(48, 48, 48, 1),
        ),
        minimumSize: _(
          const Size(180, 60),
        ),
      ),
      onPressed: onPressed,
      child: const Text(
        "Submit",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
