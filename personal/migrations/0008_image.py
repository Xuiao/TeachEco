# Generated by Django 3.1.5 on 2021-12-05 21:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('personal', '0007_auto_20211123_2330'),
    ]

    operations = [
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('caption', models.CharField(max_length=100)),
                ('image', models.ImageField(upload_to='img/%y')),
            ],
        ),
    ]
