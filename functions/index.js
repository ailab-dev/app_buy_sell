const logger = require("firebase-functions/logger");
const { onDocumentCreated } = require("firebase-functions/v2/firestore");

const admin = require('firebase-admin');
const { FieldValue } = require("firebase-admin/firestore");

admin.initializeApp();

exports.pushNewApp = onDocumentCreated('apps/{docId}', async (event) => {
    const snapshot = event.data;
    if (!snapshot) {
        return;
    }
    const newApp = snapshot.data();
    const ownerId = newApp.ownerId;

    await admin.firestore().collection('users')
        .where('id', '!=', ownerId)
        .get().then(result => {
            result.forEach((doc) => {
                pushNotification(doc.data(), newApp);
            });
        });
});

async function pushNotification(user, newApp) {
    const ownerQuery = admin.firestore().collection('users').doc(newApp.ownerId);
    const owner = (await ownerQuery.get()).data();

    const doc = admin.firestore().collection('users').doc(user.id).collection('notification').doc();
    const notification = {
        'type': 'newApp',
        'id': doc.id,
        'content': '新しいアプリが登録されました',
        'title': '新しいアプリ',
        'iconUrl': newApp.iconUrl,
        'appId': newApp.id,
        'appName': newApp.name,
        'userId': newApp.ownerId,
        'userName': owner.userName,
        'createdAt': FieldValue.serverTimestamp(),
        'read': false,
    };
    await doc.set(notification);

    if (user.fcmToken && user.fcmToken != '') {
        const body = {
            'type': 'newApp',
            'id': doc.id,
            'content': '新しいアプリが登録されました',
            'title': '新しいアプリ',
            'iconUrl': newApp.iconUrl,
            'appId': newApp.id,
            'appName': newApp.name,
            'userId': newApp.ownerId,
            'userName': owner.userName,
        };
        const payload = {
            token: user.fcmToken,
            notification: {
                title: '新しいアプリ',
                body: '新しいアプリが登録されました'
            },
            data: {
                body: JSON.stringify(body),
            }
        };

        admin.messaging().send(payload);
    }

}

exports.pushNewPurchase = onDocumentCreated('users/{userId}/app/{appId}', async (event) => {
    const snapshot = event.data;
    if (!snapshot) {
        return;
    }
    const userId = event.params.userId;
    const appId = event.params.appId;
    const userQuery = admin.firestore().collection('users').doc(userId);
    const user = (await userQuery.get()).data();

    const appQuery = admin.firestore().collection('apps').doc(appId);
    const app = (await appQuery.get()).data()

    const ownerQuery = admin.firestore().collection('users').doc(app.ownerId);
    const owner = (await ownerQuery.get()).data();

    const docOwner = admin.firestore().collection('users').doc(owner.id).collection('notification').doc();
    const notificationForOwner = {
        'type': 'purchase',
        'id': docOwner.id,
        'content': `${user.userName}さんが購入しました。`,
        'title': 'アプリを購入',
        'iconUrl': app.iconUrl,
        'appId': app.id,
        'appName': app.name,
        'userId': user.id,
        'userName': user.userName,
        'createdAt': FieldValue.serverTimestamp(),
        'read': false,
    };
    await docOwner.set(notificationForOwner);

    if (owner.fcmToken && owner.fcmToken != '') {
        const body = {
            'type': 'purchase',
            'id': docOwner.id,
            'content': `${user.userName}さんが購入しました。`,
            'title': 'アプリを購入',
            'iconUrl': app.iconUrl,
            'appId': app.id,
            'appName': app.name,
            'userId': user.id,
            'userName': user.userName,
        };

        const payload = {
            token: owner.fcmToken,
            notification: {
                title: 'アプリを購入',
                body: `${user.userName}さんが購入しました。`
            },
            data: {
                body: JSON.stringify(body),
            }
        };

        admin.messaging().send(payload);
    }

    const docPurchaser = admin.firestore().collection('users').doc(user.id).collection('notification').doc();
    const notificationForPurchaser = {
        'type': 'purchase',
        'id': docPurchaser.id,
        'content': '購入完了しました。',
        'title': 'アプリを購入',
        'iconUrl': app.iconUrl,
        'appId': app.id,
        'appName': app.name,
        'userId': owner.id,
        'userName': owner.userName,
        'createdAt': FieldValue.serverTimestamp(),
        'read': false,
    };
    await docPurchaser.set(notificationForPurchaser);
});