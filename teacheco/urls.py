"""teacheco URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from personal.views import *
from members.views import *
from django.conf.urls.static import static
from django.conf import settings

app_name = 'quizes'
urlpatterns = [
    path('admin/', admin.site.urls),
    path('home', home_view, name="home"),
    # path('signup', signup_view),
    path('', landing_view),
    path('blog', BlogView.as_view(), name="blog"),
    path('blogsingle/<int:pk>', BlogSingle.as_view(), name='blog-single'),
    path('contact', contact_view),
    path('addpost', AddPostView.as_view(), name='addpost'),
    path('blogsingle/edit/<int:pk>', UpdatePostView.as_view(), name='updatepost'),
    path('blogsingle/<int:pk>/delete',
         DeletePostView.as_view(), name='deletepost'),
    path('members/', include('django.contrib.auth.urls')),
    path('members/', include('members.urls')),
    path('signup/', signup_view, name='signup'),
    path('login/', login_view, name="login"),
    path('quiz/', include('quiz.urls')),
    #path('', include('quizes.urls')),
    path('quizes/', include('quizes.urls')),

]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
