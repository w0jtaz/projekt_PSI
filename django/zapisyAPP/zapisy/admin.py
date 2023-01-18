from django.contrib import admin
from .models import zawodnik
from .models import wydarzenie
from .models import zapisy
from .models import klient
from .models import wyniki
from .models import dystans

# Register your models here.
admin.site.register(zawodnik)
admin.site.register(wydarzenie)
admin.site.register(zapisy)
admin.site.register(klient)
admin.site.register(wyniki)
admin.site.register(dystans)
