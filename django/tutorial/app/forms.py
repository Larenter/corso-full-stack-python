from django import forms


class ContactForm(forms.Form):
    name = forms.CharField(
        widget=forms.TextInput,
        max_length=100,
    )
    email = forms.EmailField()
    message = forms.CharField(
        widget=forms.Textarea
    )
    