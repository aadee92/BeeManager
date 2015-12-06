# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('HiveManagement', '0011_field_weather_conditions'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='field',
            unique_together=set([('name', 'date_added')]),
        ),
        migrations.AlterUniqueTogether(
            name='team',
            unique_together=set([('name',)]),
        ),
        migrations.RemoveField(
            model_name='field',
            name='weather_conditions',
        ),
    ]
