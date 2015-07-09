.class public Lcom/android/internal/telephony/LgeLteRIL;
.super Lcom/android/internal/telephony/RIL;
.source "LgeLteRIL.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/LgeLteRIL$1;,
        Lcom/android/internal/telephony/LgeLteRIL$IccHandler;
    }
.end annotation


# instance fields
.field RILJ_LOGD:Z

.field RILJ_LOGV:Z

.field private final RIL_INT_RADIO_OFF:I

.field private final RIL_INT_RADIO_ON:I

.field private final RIL_INT_RADIO_ON_HTC:I

.field private final RIL_INT_RADIO_ON_NG:I

.field private final RIL_INT_RADIO_UNAVALIABLE:I

.field private isGSM:Z

.field protected mAid:Ljava/lang/String;

.field protected mIccHandler:Lcom/android/internal/telephony/LgeLteRIL$IccHandler;

.field protected mIccThread:Landroid/os/HandlerThread;

.field protected mLastDataIface:[Ljava/lang/String;

.field private mPendingIccIdResponse:Landroid/os/Message;

.field private mSetPreferredNetworkType:I

.field protected mUSIM:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "networkMode"    # I
    .param p3, "cdmaSubscription"    # I

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 78
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;II)V

    .line 57
    iput-boolean v1, p0, Lcom/android/internal/telephony/LgeLteRIL;->mUSIM:Z

    .line 58
    const/16 v0, 0x14

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/android/internal/telephony/LgeLteRIL;->mLastDataIface:[Ljava/lang/String;

    .line 59
    iput-boolean v2, p0, Lcom/android/internal/telephony/LgeLteRIL;->RILJ_LOGV:Z

    .line 60
    iput-boolean v2, p0, Lcom/android/internal/telephony/LgeLteRIL;->RILJ_LOGD:Z

    .line 62
    iput v1, p0, Lcom/android/internal/telephony/LgeLteRIL;->RIL_INT_RADIO_OFF:I

    .line 63
    iput v2, p0, Lcom/android/internal/telephony/LgeLteRIL;->RIL_INT_RADIO_UNAVALIABLE:I

    .line 64
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/internal/telephony/LgeLteRIL;->RIL_INT_RADIO_ON:I

    .line 65
    const/16 v0, 0xa

    iput v0, p0, Lcom/android/internal/telephony/LgeLteRIL;->RIL_INT_RADIO_ON_NG:I

    .line 66
    const/16 v0, 0xd

    iput v0, p0, Lcom/android/internal/telephony/LgeLteRIL;->RIL_INT_RADIO_ON_HTC:I

    .line 67
    iput v3, p0, Lcom/android/internal/telephony/LgeLteRIL;->mSetPreferredNetworkType:I

    .line 70
    iput-boolean v1, p0, Lcom/android/internal/telephony/LgeLteRIL;->isGSM:Z

    .line 79
    iput v3, p0, Lcom/android/internal/telephony/LgeLteRIL;->mSetPreferredNetworkType:I

    .line 80
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/internal/telephony/LgeLteRIL;->mQANElements:I

    .line 81
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILjava/lang/Integer;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "preferredNetworkType"    # I
    .param p3, "cdmaSubscription"    # I
    .param p4, "instanceId"    # Ljava/lang/Integer;

    .prologue
    .line 74
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/LgeLteRIL;-><init>(Landroid/content/Context;II)V

    .line 75
    return-void
.end method

.method private setRadioStateFromRILInt(I)V
    .locals 6
    .param p1, "stateCode"    # I

    .prologue
    const/4 v4, 0x0

    .line 477
    sparse-switch p1, :sswitch_data_0

    .line 504
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unrecognized RIL_RadioState: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 479
    :sswitch_0
    sget-object v2, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RADIO_OFF:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    .line 480
    .local v2, "radioState":Lcom/android/internal/telephony/CommandsInterface$RadioState;
    iget-object v3, p0, Lcom/android/internal/telephony/LgeLteRIL;->mIccHandler:Lcom/android/internal/telephony/LgeLteRIL$IccHandler;

    if-eqz v3, :cond_0

    .line 481
    iput-object v4, p0, Lcom/android/internal/telephony/LgeLteRIL;->mIccThread:Landroid/os/HandlerThread;

    .line 482
    iput-object v4, p0, Lcom/android/internal/telephony/LgeLteRIL;->mIccHandler:Lcom/android/internal/telephony/LgeLteRIL$IccHandler;

    .line 507
    :cond_0
    :goto_0
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/LgeLteRIL;->setRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V

    .line 508
    return-void

    .line 486
    .end local v2    # "radioState":Lcom/android/internal/telephony/CommandsInterface$RadioState;
    :sswitch_1
    sget-object v2, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RADIO_UNAVAILABLE:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    .line 487
    .restart local v2    # "radioState":Lcom/android/internal/telephony/CommandsInterface$RadioState;
    goto :goto_0

    .line 491
    .end local v2    # "radioState":Lcom/android/internal/telephony/CommandsInterface$RadioState;
    :sswitch_2
    iget-object v3, p0, Lcom/android/internal/telephony/LgeLteRIL;->mIccHandler:Lcom/android/internal/telephony/LgeLteRIL$IccHandler;

    if-nez v3, :cond_1

    .line 492
    new-instance v0, Landroid/os/HandlerThread;

    const-string v3, "IccHandler"

    invoke-direct {v0, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 493
    .local v0, "handlerThread":Landroid/os/HandlerThread;
    iput-object v0, p0, Lcom/android/internal/telephony/LgeLteRIL;->mIccThread:Landroid/os/HandlerThread;

    .line 495
    iget-object v3, p0, Lcom/android/internal/telephony/LgeLteRIL;->mIccThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->start()V

    .line 497
    iget-object v3, p0, Lcom/android/internal/telephony/LgeLteRIL;->mIccThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    .line 498
    .local v1, "looper":Landroid/os/Looper;
    new-instance v3, Lcom/android/internal/telephony/LgeLteRIL$IccHandler;

    invoke-direct {v3, p0, p0, v1}, Lcom/android/internal/telephony/LgeLteRIL$IccHandler;-><init>(Lcom/android/internal/telephony/LgeLteRIL;Lcom/android/internal/telephony/RIL;Landroid/os/Looper;)V

    iput-object v3, p0, Lcom/android/internal/telephony/LgeLteRIL;->mIccHandler:Lcom/android/internal/telephony/LgeLteRIL$IccHandler;

    .line 499
    iget-object v3, p0, Lcom/android/internal/telephony/LgeLteRIL;->mIccHandler:Lcom/android/internal/telephony/LgeLteRIL$IccHandler;

    invoke-virtual {v3}, Lcom/android/internal/telephony/LgeLteRIL$IccHandler;->run()V

    .line 501
    .end local v0    # "handlerThread":Landroid/os/HandlerThread;
    .end local v1    # "looper":Landroid/os/Looper;
    :cond_1
    sget-object v2, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RADIO_ON:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    .line 502
    .restart local v2    # "radioState":Lcom/android/internal/telephony/CommandsInterface$RadioState;
    goto :goto_0

    .line 477
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0xa -> :sswitch_2
        0xd -> :sswitch_2
    .end sparse-switch
.end method


# virtual methods
.method public changeIccPin2(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 1
    .param p1, "oldPin2"    # Ljava/lang/String;
    .param p2, "newPin2"    # Ljava/lang/String;
    .param p3, "result"    # Landroid/os/Message;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/android/internal/telephony/LgeLteRIL;->mAid:Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/android/internal/telephony/LgeLteRIL;->changeIccPin2ForApp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 91
    return-void
.end method

.method protected getDataCallResponse(Landroid/os/Parcel;I)Lcom/android/internal/telephony/dataconnection/DataCallResponse;
    .locals 9
    .param p1, "p"    # Landroid/os/Parcel;
    .param p2, "version"    # I

    .prologue
    const/4 v8, 0x0

    .line 255
    new-instance v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;

    invoke-direct {v1}, Lcom/android/internal/telephony/dataconnection/DataCallResponse;-><init>()V

    .line 257
    .local v1, "dataCall":Lcom/android/internal/telephony/dataconnection/DataCallResponse;
    const-string v5, "datacall"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/LgeLteRIL;->needsOldRilFeature(Ljava/lang/String;)Z

    move-result v4

    .line 259
    .local v4, "oldRil":Z
    if-nez v4, :cond_1

    const/4 v5, 0x5

    if-ge p2, v5, :cond_1

    .line 260
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/RIL;->getDataCallResponse(Landroid/os/Parcel;I)Lcom/android/internal/telephony/dataconnection/DataCallResponse;

    move-result-object v1

    .line 309
    .end local v1    # "dataCall":Lcom/android/internal/telephony/dataconnection/DataCallResponse;
    :cond_0
    :goto_0
    return-object v1

    .line 261
    .restart local v1    # "dataCall":Lcom/android/internal/telephony/dataconnection/DataCallResponse;
    :cond_1
    if-nez v4, :cond_5

    .line 262
    iput p2, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->version:I

    .line 263
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    iput v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->status:I

    .line 264
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    iput v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->suggestedRetryTime:I

    .line 265
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    iput v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->cid:I

    .line 266
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    iput v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->active:I

    .line 267
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->type:Ljava/lang/String;

    .line 268
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    .line 269
    iget v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->status:I

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->NONE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/DcFailCause;->getErrorCode()I

    move-result v6

    if-ne v5, v6, :cond_2

    iget-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->active:I

    if-eqz v5, :cond_2

    .line 271
    new-instance v5, Ljava/lang/RuntimeException;

    const-string v6, "getDataCallResponse, no ifname"

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 273
    :cond_2
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 274
    .local v0, "addresses":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 275
    const-string v5, " "

    invoke-virtual {v0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->addresses:[Ljava/lang/String;

    .line 277
    :cond_3
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 278
    .local v2, "dnses":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 279
    const-string v5, " "

    invoke-virtual {v2, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->dnses:[Ljava/lang/String;

    .line 281
    :cond_4
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 282
    .local v3, "gateways":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 283
    const-string v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->gateways:[Ljava/lang/String;

    goto :goto_0

    .line 286
    .end local v0    # "addresses":Ljava/lang/String;
    .end local v2    # "dnses":Ljava/lang/String;
    .end local v3    # "gateways":Ljava/lang/String;
    :cond_5
    const/4 v5, 0x4

    iput v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->version:I

    .line 287
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    iput v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->cid:I

    .line 288
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    iput v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->active:I

    .line 289
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->type:Ljava/lang/String;

    .line 290
    iget-object v5, p0, Lcom/android/internal/telephony/LgeLteRIL;->mLastDataIface:[Ljava/lang/String;

    iget v6, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->cid:I

    aget-object v5, v5, v6

    iput-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    .line 291
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 293
    iget-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 294
    iget-object v5, p0, Lcom/android/internal/telephony/LgeLteRIL;->mLastDataIface:[Ljava/lang/String;

    aget-object v5, v5, v8

    iput-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    .line 297
    :cond_6
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 298
    .restart local v0    # "addresses":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_7

    .line 299
    const-string v5, " "

    invoke-virtual {v0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->addresses:[Ljava/lang/String;

    .line 301
    :cond_7
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 302
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 304
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    iput-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->dnses:[Ljava/lang/String;

    .line 305
    iget-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->dnses:[Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "net."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".dns1"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    .line 306
    iget-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->dnses:[Ljava/lang/String;

    const/4 v6, 0x1

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "net."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".dns2"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    goto/16 :goto_0
.end method

.method public getIMSI(Landroid/os/Message;)V
    .locals 4
    .param p1, "result"    # Landroid/os/Message;

    .prologue
    const/16 v3, 0xb

    .line 120
    invoke-static {v3, p1}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 122
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 123
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    iget-object v2, p0, Lcom/android/internal/telephony/LgeLteRIL;->mAid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 125
    iget-boolean v1, p0, Lcom/android/internal/telephony/LgeLteRIL;->RILJ_LOGD:Z

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> getIMSI:RIL_REQUEST_GET_IMSI "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " aid: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/LgeLteRIL;->mAid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/LgeLteRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/LgeLteRIL;->riljLog(Ljava/lang/String;)V

    .line 131
    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/LgeLteRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 132
    return-void
.end method

.method public getImsRegistrationState(Landroid/os/Message;)V
    .locals 3
    .param p1, "result"    # Landroid/os/Message;

    .prologue
    .line 659
    iget v1, p0, Lcom/android/internal/telephony/LgeLteRIL;->mRilVersion:I

    const/16 v2, 0x8

    if-lt v1, v2, :cond_1

    .line 660
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->getImsRegistrationState(Landroid/os/Message;)V

    .line 669
    :cond_0
    :goto_0
    return-void

    .line 662
    :cond_1
    if-eqz p1, :cond_0

    .line 663
    new-instance v0, Lcom/android/internal/telephony/CommandException;

    sget-object v1, Lcom/android/internal/telephony/CommandException$Error;->REQUEST_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CommandException;-><init>(Lcom/android/internal/telephony/CommandException$Error;)V

    .line 665
    .local v0, "ex":Lcom/android/internal/telephony/CommandException;
    const/4 v1, 0x0

    invoke-static {p1, v1, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 666
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0
.end method

.method public getNeighboringCids(Landroid/os/Message;)V
    .locals 3
    .param p1, "response"    # Landroid/os/Message;

    .prologue
    .line 358
    invoke-virtual {p0}, Lcom/android/internal/telephony/LgeLteRIL;->getRadioState()Lcom/android/internal/telephony/CommandsInterface$RadioState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/CommandsInterface$RadioState;->isOn()Z

    move-result v1

    if-nez v1, :cond_0

    .line 367
    :goto_0
    return-void

    .line 361
    :cond_0
    const/16 v1, 0x4b

    invoke-static {v1, p1}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 364
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-boolean v1, p0, Lcom/android/internal/telephony/LgeLteRIL;->RILJ_LOGD:Z

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/LgeLteRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/LgeLteRIL;->riljLog(Ljava/lang/String;)V

    .line 366
    :cond_1
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/LgeLteRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    goto :goto_0
.end method

.method public iccIO(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 11
    .param p1, "command"    # I
    .param p2, "fileid"    # I
    .param p3, "path"    # Ljava/lang/String;
    .param p4, "p1"    # I
    .param p5, "p2"    # I
    .param p6, "p3"    # I
    .param p7, "data"    # Ljava/lang/String;
    .param p8, "pin2"    # Ljava/lang/String;
    .param p9, "result"    # Landroid/os/Message;

    .prologue
    .line 138
    iget-object v9, p0, Lcom/android/internal/telephony/LgeLteRIL;->mAid:Ljava/lang/String;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v10, p9

    invoke-virtual/range {v0 .. v10}, Lcom/android/internal/telephony/LgeLteRIL;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 139
    return-void
.end method

.method protected processUnsolicited(Landroid/os/Parcel;)V
    .locals 7
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v6, 0x0

    .line 412
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    .line 413
    .local v0, "dataPosition":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 417
    .local v1, "response":I
    const-string v4, "datacall"

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/LgeLteRIL;->needsOldRilFeature(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 418
    packed-switch v1, :pswitch_data_0

    .line 428
    :cond_0
    packed-switch v1, :pswitch_data_1

    .line 438
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 441
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->processUnsolicited(Landroid/os/Parcel;)V

    .line 469
    :cond_1
    :goto_0
    :sswitch_0
    return-void

    .line 423
    :pswitch_0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/LgeLteRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .line 424
    .local v2, "ret":Ljava/lang/Object;
    goto :goto_0

    .line 430
    .end local v2    # "ret":Ljava/lang/Object;
    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/LgeLteRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .line 445
    .restart local v2    # "ret":Ljava/lang/Object;
    :goto_1
    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    .line 447
    :sswitch_1
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 448
    .local v3, "state":I
    invoke-direct {p0, v3}, Lcom/android/internal/telephony/LgeLteRIL;->setRadioStateFromRILInt(I)V

    goto :goto_0

    .line 431
    .end local v2    # "ret":Ljava/lang/Object;
    .end local v3    # "state":I
    :pswitch_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/LgeLteRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 432
    .end local v2    # "ret":Ljava/lang/Object;
    :pswitch_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/LgeLteRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 433
    .end local v2    # "ret":Ljava/lang/Object;
    :pswitch_4
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/LgeLteRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 434
    .end local v2    # "ret":Ljava/lang/Object;
    :pswitch_5
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/LgeLteRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 451
    :sswitch_2
    iget-boolean v4, p0, Lcom/android/internal/telephony/LgeLteRIL;->RILJ_LOGD:Z

    if-eqz v4, :cond_2

    invoke-virtual {p0, v1, v2}, Lcom/android/internal/telephony/LgeLteRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 453
    :cond_2
    check-cast v2, [I

    .end local v2    # "ret":Ljava/lang/Object;
    check-cast v2, [I

    const/4 v4, 0x0

    aget v4, v2, v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/LgeLteRIL;->notifyRegistrantsRilConnectionChanged(I)V

    goto :goto_0

    .line 459
    .restart local v2    # "ret":Ljava/lang/Object;
    :sswitch_3
    iget-boolean v4, p0, Lcom/android/internal/telephony/LgeLteRIL;->RILJ_LOGD:Z

    if-eqz v4, :cond_3

    invoke-virtual {p0, v1, v2}, Lcom/android/internal/telephony/LgeLteRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 461
    :cond_3
    iget-object v4, p0, Lcom/android/internal/telephony/LgeLteRIL;->mExitEmergencyCallbackModeRegistrants:Landroid/os/RegistrantList;

    if-eqz v4, :cond_1

    .line 462
    iget-object v4, p0, Lcom/android/internal/telephony/LgeLteRIL;->mExitEmergencyCallbackModeRegistrants:Landroid/os/RegistrantList;

    new-instance v5, Landroid/os/AsyncResult;

    invoke-direct {v5, v6, v6, v6}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v4, v5}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto :goto_0

    .line 418
    nop

    :pswitch_data_0
    .packed-switch 0x407
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 428
    :pswitch_data_1
    .packed-switch 0x40a
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch

    .line 445
    :sswitch_data_0
    .sparse-switch
        0x3e8 -> :sswitch_1
        0x40a -> :sswitch_2
        0x40b -> :sswitch_0
        0x40c -> :sswitch_0
        0x40d -> :sswitch_3
    .end sparse-switch
.end method

.method public queryFacilityLock(Ljava/lang/String;Ljava/lang/String;ILandroid/os/Message;)V
    .locals 6
    .param p1, "facility"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "serviceClass"    # I
    .param p4, "response"    # Landroid/os/Message;

    .prologue
    .line 107
    iget-object v4, p0, Lcom/android/internal/telephony/LgeLteRIL;->mAid:Ljava/lang/String;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/telephony/LgeLteRIL;->queryFacilityLockForApp(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Landroid/os/Message;)V

    .line 108
    return-void
.end method

.method protected responseIccCardStatus(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 14
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    const/4 v13, 0x2

    .line 146
    new-instance v8, Lcom/android/internal/telephony/uicc/IccCardStatus;

    invoke-direct {v8}, Lcom/android/internal/telephony/uicc/IccCardStatus;-><init>()V

    .line 147
    .local v8, "status":Lcom/android/internal/telephony/uicc/IccCardStatus;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 151
    .local v5, "cardState":I
    if-le v5, v13, :cond_0

    .line 152
    add-int/lit8 v5, v5, -0x3

    .line 154
    :cond_0
    invoke-virtual {v8, v5}, Lcom/android/internal/telephony/uicc/IccCardStatus;->setCardState(I)V

    .line 155
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    invoke-virtual {v8, v11}, Lcom/android/internal/telephony/uicc/IccCardStatus;->setUniversalPinState(I)V

    .line 156
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    iput v11, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mGsmUmtsSubscriptionAppIndex:I

    .line 157
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    iput v11, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mCdmaSubscriptionAppIndex:I

    .line 158
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    iput v11, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mImsSubscriptionAppIndex:I

    .line 160
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    .line 163
    .local v7, "numApplications":I
    const/16 v11, 0x8

    if-le v7, v11, :cond_1

    .line 164
    const/16 v7, 0x8

    .line 166
    :cond_1
    new-array v11, v7, [Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    iput-object v11, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mApplications:[Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    .line 168
    new-instance v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    invoke-direct {v2}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;-><init>()V

    .line 169
    .local v2, "ca":Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    if-ge v6, v7, :cond_4

    .line 170
    if-eqz v6, :cond_2

    .line 171
    new-instance v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    .end local v2    # "ca":Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
    invoke-direct {v2}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;-><init>()V

    .line 173
    .restart local v2    # "ca":Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
    :cond_2
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    invoke-virtual {v2, v11}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->AppTypeFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    move-result-object v11

    iput-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_type:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    .line 174
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    invoke-virtual {v2, v11}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->AppStateFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    move-result-object v11

    iput-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_state:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    .line 175
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    invoke-virtual {v2, v11}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->PersoSubstateFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    move-result-object v11

    iput-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->perso_substate:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .line 176
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->aid:Ljava/lang/String;

    .line 177
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_label:Ljava/lang/String;

    .line 178
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    iput v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1_replaced:I

    .line 179
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    invoke-virtual {v2, v11}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->PinStateFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    move-result-object v11

    iput-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .line 180
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    invoke-virtual {v2, v11}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->PinStateFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    move-result-object v11

    iput-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin2:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .line 181
    const-string v11, "skippinpukcount"

    invoke-virtual {p0, v11}, Lcom/android/internal/telephony/LgeLteRIL;->needsOldRilFeature(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_3

    .line 182
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 183
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 184
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 185
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 187
    :cond_3
    iget-object v11, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mApplications:[Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    aput-object v2, v11, v6

    .line 169
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 190
    :cond_4
    if-ne v7, v9, :cond_5

    iget-boolean v11, p0, Lcom/android/internal/telephony/LgeLteRIL;->isGSM:Z

    if-nez v11, :cond_5

    iget-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_type:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    invoke-virtual {v2, v13}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->AppTypeFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    move-result-object v12

    if-ne v11, v12, :cond_5

    .line 191
    add-int/lit8 v11, v7, 0x2

    new-array v11, v11, [Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    iput-object v11, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mApplications:[Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    .line 192
    iput v10, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mGsmUmtsSubscriptionAppIndex:I

    .line 193
    iget-object v11, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mApplications:[Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    iget v12, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mGsmUmtsSubscriptionAppIndex:I

    aput-object v2, v11, v12

    .line 194
    iput v9, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mCdmaSubscriptionAppIndex:I

    .line 195
    iput v13, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mImsSubscriptionAppIndex:I

    .line 196
    new-instance v3, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;-><init>()V

    .line 197
    .local v3, "ca2":Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
    const/4 v11, 0x4

    invoke-virtual {v3, v11}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->AppTypeFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    move-result-object v11

    iput-object v11, v3, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_type:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    .line 198
    iget-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_state:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    iput-object v11, v3, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_state:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    .line 199
    iget-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->perso_substate:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    iput-object v11, v3, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->perso_substate:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .line 200
    iget-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->aid:Ljava/lang/String;

    iput-object v11, v3, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->aid:Ljava/lang/String;

    .line 201
    iget-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_label:Ljava/lang/String;

    iput-object v11, v3, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_label:Ljava/lang/String;

    .line 202
    iget v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1_replaced:I

    iput v11, v3, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1_replaced:I

    .line 203
    iget-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    iput-object v11, v3, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .line 204
    iget-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin2:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    iput-object v11, v3, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin2:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .line 205
    iget-object v11, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mApplications:[Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    iget v12, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mCdmaSubscriptionAppIndex:I

    aput-object v3, v11, v12

    .line 206
    new-instance v4, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    invoke-direct {v4}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;-><init>()V

    .line 207
    .local v4, "ca3":Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
    const/4 v11, 0x5

    invoke-virtual {v4, v11}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->AppTypeFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    move-result-object v11

    iput-object v11, v4, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_type:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    .line 208
    iget-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_state:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    iput-object v11, v4, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_state:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    .line 209
    iget-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->perso_substate:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    iput-object v11, v4, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->perso_substate:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .line 210
    iget-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->aid:Ljava/lang/String;

    iput-object v11, v4, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->aid:Ljava/lang/String;

    .line 211
    iget-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_label:Ljava/lang/String;

    iput-object v11, v4, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_label:Ljava/lang/String;

    .line 212
    iget v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1_replaced:I

    iput v11, v4, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1_replaced:I

    .line 213
    iget-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    iput-object v11, v4, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .line 214
    iget-object v11, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin2:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    iput-object v11, v4, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin2:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .line 215
    iget-object v11, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mApplications:[Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    iget v12, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mImsSubscriptionAppIndex:I

    aput-object v4, v11, v12

    .line 218
    .end local v3    # "ca2":Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
    .end local v4    # "ca3":Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
    :cond_5
    const/4 v0, -0x1

    .line 219
    .local v0, "appIndex":I
    iget v11, p0, Lcom/android/internal/telephony/LgeLteRIL;->mPhoneType:I

    if-ne v11, v13, :cond_7

    iget v11, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mCdmaSubscriptionAppIndex:I

    if-ltz v11, :cond_7

    .line 221
    iget v0, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mCdmaSubscriptionAppIndex:I

    .line 222
    const-string v11, "RILJ"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "This is a CDMA PHONE "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    :goto_1
    const/16 v11, 0xb

    if-ne v5, v11, :cond_8

    .line 244
    :cond_6
    :goto_2
    return-object v8

    .line 224
    :cond_7
    iget v0, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mGsmUmtsSubscriptionAppIndex:I

    .line 225
    const-string v11, "RILJ"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "This is a GSM PHONE "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 232
    :cond_8
    if-lez v7, :cond_6

    .line 233
    iget-object v11, v8, Lcom/android/internal/telephony/uicc/IccCardStatus;->mApplications:[Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    aget-object v1, v11, v0

    .line 234
    .local v1, "application":Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
    iget-object v11, v1, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->aid:Ljava/lang/String;

    iput-object v11, p0, Lcom/android/internal/telephony/LgeLteRIL;->mAid:Ljava/lang/String;

    .line 235
    iget-object v11, v1, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_type:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    sget-object v12, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;->APPTYPE_USIM:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    if-ne v11, v12, :cond_a

    :goto_3
    iput-boolean v9, p0, Lcom/android/internal/telephony/LgeLteRIL;->mUSIM:Z

    .line 237
    iget v9, p0, Lcom/android/internal/telephony/LgeLteRIL;->mPreferredNetworkType:I

    iput v9, p0, Lcom/android/internal/telephony/LgeLteRIL;->mSetPreferredNetworkType:I

    .line 239
    iget-object v9, p0, Lcom/android/internal/telephony/LgeLteRIL;->mAid:Ljava/lang/String;

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 240
    const-string v9, ""

    iput-object v9, p0, Lcom/android/internal/telephony/LgeLteRIL;->mAid:Ljava/lang/String;

    .line 241
    :cond_9
    const-string v9, "RILJ"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "mAid "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/internal/telephony/LgeLteRIL;->mAid:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_a
    move v9, v10

    .line 235
    goto :goto_3
.end method

.method protected responseSetupDataCall(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 8
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 317
    const-string v3, "datacall"

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/LgeLteRIL;->needsOldRilFeature(Ljava/lang/String;)Z

    move-result v2

    .line 319
    .local v2, "oldRil":Z
    if-nez v2, :cond_0

    .line 320
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->responseSetupDataCall(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    .line 353
    :goto_0
    return-object v1

    .line 322
    :cond_0
    new-instance v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;

    invoke-direct {v1}, Lcom/android/internal/telephony/dataconnection/DataCallResponse;-><init>()V

    .line 323
    .local v1, "dataCall":Lcom/android/internal/telephony/dataconnection/DataCallResponse;
    const/4 v3, 0x4

    iput v3, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->version:I

    .line 325
    iput v6, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->cid:I

    .line 326
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 327
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    .line 328
    iget v3, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->status:I

    sget-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->NONE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    invoke-virtual {v4}, Lcom/android/internal/telephony/dataconnection/DcFailCause;->getErrorCode()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget-object v3, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->active:I

    if-eqz v3, :cond_1

    .line 330
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "RIL_REQUEST_SETUP_DATA_CALL response, no ifname"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 334
    :cond_1
    const-string v3, "singlepdp"

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/LgeLteRIL;->needsOldRilFeature(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 335
    iget-object v3, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    iget-object v4, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->cid:I

    .line 339
    :cond_2
    iget-object v3, p0, Lcom/android/internal/telephony/LgeLteRIL;->mLastDataIface:[Ljava/lang/String;

    iget v4, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->cid:I

    iget-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    aput-object v5, v3, v4

    .line 342
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 343
    .local v0, "addresses":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 344
    const-string v3, " "

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->addresses:[Ljava/lang/String;

    .line 347
    :cond_3
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    iput-object v3, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->dnses:[Ljava/lang/String;

    .line 348
    iget-object v3, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->dnses:[Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "net."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".dns1"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    .line 349
    iget-object v3, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->dnses:[Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "net."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".dns2"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    .line 350
    iput v7, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->active:I

    .line 351
    iput v6, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->status:I

    goto/16 :goto_0
.end method

.method protected responseSignalStrength(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 20
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 386
    const/16 v17, 0xc

    .line 389
    .local v17, "numInts":I
    const-string v1, "signalstrength"

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/LgeLteRIL;->needsOldRilFeature(Ljava/lang/String;)Z

    move-result v18

    .line 390
    .local v18, "oldRil":Z
    const/16 v16, 0x0

    .line 393
    .local v16, "noLte":Z
    move/from16 v0, v17

    new-array v0, v0, [I

    move-object/from16 v19, v0

    .line 394
    .local v19, "response":[I
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_0
    move/from16 v0, v17

    if-ge v15, v0, :cond_3

    .line 395
    if-nez v18, :cond_0

    if-eqz v16, :cond_2

    :cond_0
    const/4 v1, 0x6

    if-le v15, v1, :cond_2

    const/16 v1, 0xc

    if-ge v15, v1, :cond_2

    .line 396
    const/4 v1, -0x1

    aput v1, v19, v15

    .line 400
    :goto_1
    const/4 v1, 0x7

    if-ne v15, v1, :cond_1

    aget v1, v19, v15

    const/16 v2, 0x63

    if-ne v1, v2, :cond_1

    .line 401
    const/4 v1, -0x1

    aput v1, v19, v15

    .line 402
    const/16 v16, 0x1

    .line 394
    :cond_1
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 398
    :cond_2
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    aput v1, v19, v15

    goto :goto_1

    .line 405
    :cond_3
    new-instance v1, Landroid/telephony/SignalStrength;

    const/4 v2, 0x0

    aget v2, v19, v2

    const/4 v3, 0x1

    aget v3, v19, v3

    const/4 v4, 0x2

    aget v4, v19, v4

    const/4 v5, 0x3

    aget v5, v19, v5

    const/4 v6, 0x4

    aget v6, v19, v6

    const/4 v7, 0x5

    aget v7, v19, v7

    const/4 v8, 0x6

    aget v8, v19, v8

    const/4 v9, 0x7

    aget v9, v19, v9

    const/16 v10, 0x8

    aget v10, v19, v10

    const/16 v11, 0x9

    aget v11, v19, v11

    const/16 v12, 0xa

    aget v12, v19, v12

    const/16 v13, 0xb

    aget v13, v19, v13

    const/4 v14, 0x1

    invoke-direct/range {v1 .. v14}, Landroid/telephony/SignalStrength;-><init>(IIIIIIIIIIIIZ)V

    return-object v1
.end method

.method public setFacilityLock(Ljava/lang/String;ZLjava/lang/String;ILandroid/os/Message;)V
    .locals 7
    .param p1, "facility"    # Ljava/lang/String;
    .param p2, "lockState"    # Z
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "serviceClass"    # I
    .param p5, "response"    # Landroid/os/Message;

    .prologue
    .line 114
    iget-object v5, p0, Lcom/android/internal/telephony/LgeLteRIL;->mAid:Ljava/lang/String;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/android/internal/telephony/LgeLteRIL;->setFacilityLockForApp(Ljava/lang/String;ZLjava/lang/String;ILjava/lang/String;Landroid/os/Message;)V

    .line 115
    return-void
.end method

.method public setNetworkSelectionModeManual(Ljava/lang/String;Landroid/os/Message;)V
    .locals 3
    .param p1, "operatorNumeric"    # Ljava/lang/String;
    .param p2, "response"    # Landroid/os/Message;

    .prologue
    .line 617
    const/16 v1, 0x2f

    invoke-static {v1, p2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 621
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-boolean v1, p0, Lcom/android/internal/telephony/LgeLteRIL;->RILJ_LOGD:Z

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/LgeLteRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/LgeLteRIL;->riljLog(Ljava/lang/String;)V

    .line 624
    :cond_0
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 625
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 626
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const-string v2, "NOCHANGE"

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 628
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/LgeLteRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 629
    return-void
.end method

.method public setPhoneType(I)V
    .locals 1
    .param p1, "phoneType"    # I

    .prologue
    .line 249
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->setPhoneType(I)V

    .line 250
    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/android/internal/telephony/LgeLteRIL;->isGSM:Z

    .line 251
    return-void

    .line 250
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setPreferredNetworkType(ILandroid/os/Message;)V
    .locals 1
    .param p1, "networkType"    # I
    .param p2, "response"    # Landroid/os/Message;

    .prologue
    .line 374
    iget-boolean v0, p0, Lcom/android/internal/telephony/LgeLteRIL;->mUSIM:Z

    if-nez v0, :cond_0

    const/16 v0, 0x9

    if-ne p1, v0, :cond_0

    iget v0, p0, Lcom/android/internal/telephony/LgeLteRIL;->mSetPreferredNetworkType:I

    if-ltz v0, :cond_0

    .line 376
    const/4 p1, 0x0

    .line 378
    :cond_0
    iput p1, p0, Lcom/android/internal/telephony/LgeLteRIL;->mSetPreferredNetworkType:I

    .line 380
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/RIL;->setPreferredNetworkType(ILandroid/os/Message;)V

    .line 381
    return-void
.end method

.method public setupDataCall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 5
    .param p1, "radioTechnology"    # Ljava/lang/String;
    .param p2, "profile"    # Ljava/lang/String;
    .param p3, "apn"    # Ljava/lang/String;
    .param p4, "user"    # Ljava/lang/String;
    .param p5, "password"    # Ljava/lang/String;
    .param p6, "authType"    # Ljava/lang/String;
    .param p7, "protocol"    # Ljava/lang/String;
    .param p8, "result"    # Landroid/os/Message;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 637
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 638
    const/16 v1, 0x16f

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 641
    .local v0, "rrSPT":Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 642
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 643
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 644
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 645
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 646
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 647
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 648
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 649
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 650
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 651
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/LgeLteRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 653
    .end local v0    # "rrSPT":Lcom/android/internal/telephony/RILRequest;
    :cond_0
    invoke-super/range {p0 .. p8}, Lcom/android/internal/telephony/RIL;->setupDataCall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 655
    return-void
.end method

.method public supplyIccPin2(Ljava/lang/String;Landroid/os/Message;)V
    .locals 1
    .param p1, "pin"    # Ljava/lang/String;
    .param p2, "result"    # Landroid/os/Message;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/android/internal/telephony/LgeLteRIL;->mAid:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lcom/android/internal/telephony/LgeLteRIL;->supplyIccPin2ForApp(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 86
    return-void
.end method

.method public supplyIccPuk(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 1
    .param p1, "puk"    # Ljava/lang/String;
    .param p2, "newPin"    # Ljava/lang/String;
    .param p3, "result"    # Landroid/os/Message;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/android/internal/telephony/LgeLteRIL;->mAid:Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/android/internal/telephony/LgeLteRIL;->supplyIccPukForApp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 96
    return-void
.end method

.method public supplyIccPuk2(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 1
    .param p1, "puk2"    # Ljava/lang/String;
    .param p2, "newPin2"    # Ljava/lang/String;
    .param p3, "result"    # Landroid/os/Message;

    .prologue
    .line 100
    iget-object v0, p0, Lcom/android/internal/telephony/LgeLteRIL;->mAid:Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/android/internal/telephony/LgeLteRIL;->supplyIccPuk2ForApp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 101
    return-void
.end method
