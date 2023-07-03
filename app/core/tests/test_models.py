from django.test import TestCase
from django.contrib.auth import get_user_model

from core import models


class ModelsTests(TestCase):
    def test_create_user_with_email_successful(self):
        email = 'fake@example.com'
        password = 'fakepass123'
        user = get_user_model().objects.create_user(
            email=email,
            password=password,
        )

        self.assertEqual(user.email, email)
        self.assertTrue(user.check_password(password))
        self.assertEqual(models.User.objects.count(), 1)

        user.delete()

        self.assertEqual(models.User.objects.count(), 0)

    def test_new_user_email_normalized(self):
        emails = [
            ['fake1@EXAMPLE.com', 'fake1@example.com'],
            ['Fake2@Example.com', 'fake2@example.com'],
            ['FAKE3@EXAMPLE.COM', 'fake3@example.com'],
            ['fake4@example.COM', 'fake4@example.com'],
        ]

        for email, expected in emails:
            user = get_user_model().objects.create_user(email, 'fakepass123')
            self.assertEqual(user.email, expected)

